require 'require_all'
require_all './*.rb'

class QuestionFollow
  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, users.fname, users.lname
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.question_id
    JOIN
      users ON question_follows.user_id = users.id
    WHERE
      questions.id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def self.followed_question_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT questions.id, questions.title, questions.body, questions.user_id
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.question_id
    JOIN
      users ON question_follows.user_id = users.id
    WHERE
      users.id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        -- results.id, results.title, results.body, results.user_id
        results.*
      FROM (
        SELECT
          *
        FROM
          questions
        JOIN
          question_follows ON questions.id = question_follows.question_id
        JOIN
          users ON question_follows.user_id = users.id
      ) AS results
      GROUP BY
        results.question_id
      ORDER BY
        COUNT(results.user_id) DESC LIMIT ?
    SQL

    questions.map { |question| Question.new(question) }
  end
end
