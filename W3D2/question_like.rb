require 'require_all'
require_all './*.rb'

class QuestionLike
  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        likes
      JOIN
        users ON likes.user_id = users.id
      WHERE
        likes.question_id = ?
    SQL
    users.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    count = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(users.id) AS count
      FROM
        likes
      JOIN
        users ON likes.user_id = users.id
      WHERE
        likes.question_id = ?
    SQL
    count.first['count']
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        likes
      JOIN
        questions ON likes.question_id = questions.id
      WHERE
        likes.user_id = ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.*
      FROM
      likes
      JOIN questions ON likes.question_id = questions.id
      GROUP BY question_id
      ORDER BY COUNT(likes.user_id) DESC
      LIMIT ?
    SQL
    questions.map { |question| Question.new(question) }
  end
end
