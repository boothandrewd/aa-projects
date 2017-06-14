require 'require_all'
require_all './*.rb'

class User
  def self.find_by_id(id)
    info = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM users WHERE id = ?
    SQL
    new(info.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT * FROM users WHERE fname = ? AND lname = ?
    SQL
    new(user.first)
  end

  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_question_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    average = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT (CAST(SUM(like_count) AS float) / CAST(COUNT(*) AS float)) AS average
      FROM (
        SELECT
          COUNT(likes.user_id) AS like_count
        FROM
          likes
        JOIN
          questions ON likes.question_id = questions.id
        WHERE
          questions.user_id = ?
        GROUP BY
          question_id
      );
    SQL
    average.first['average']
  end
end
