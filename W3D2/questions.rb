# require 'sqlite3'
# require 'singleton'

# class QuestionsDatabase < SQLite3::Database
#   include Singleton
#
#   def initialize
#     super('questions.db')
#     self.type_translation = true
#     self.results_as_hash = true
#   end
# end
#
# class User
#   def self.find_by_id(id)
#     info = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT * FROM users WHERE id = ?
#     SQL
#     new(info.first)
#   end
#
#   def self.find_by_name(fname, lname)
#     user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
#       SELECT * FROM users WHERE fname = ? AND lname = ?
#     SQL
#     new(user.first)
#   end
#
#   attr_accessor :fname, :lname
#
#   def initialize(options)
#     @id = options['id']
#     @fname = options['fname']
#     @lname = options['lname']
#   end
#
#   def authored_questions
#     Question.find_by_author_id(@id)
#   end
#
#   def authored_replies
#     Reply.find_by_user_id(@id)
#   end
# end
#
# class Question
#   attr_accessor :title, :body, :user_id
#
#   def self.find_by_author_id(author_id)
#     questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
#       SELECT * FROM questions WHERE user_id = ?
#     SQL
#     questions.map { |question| new(question) }
#   end
#
#   def self.find_by_id(id)
#     question = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT * FROM questions WHERE id = ?
#     SQL
#     new(question.first)
#   end
#
#   def initialize(options)
#     @id = options['id']
#     @title = options['title']
#     @body = options['body']
#     @user_id = options['user_id']
#   end
#
#   def author
#     User.find_by_id(@user_id)
#   end
#
#   def replies
#     Reply.find_by_question_id(@id)
#   end
# end
#
# class Reply
#   attr_accessor :question_id, :parent_id, :user_id, :body
#
#   def self.find_by_user_id(user_id)
#     replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
#       SELECT * FROM replies WHERE user_id = ?
#     SQL
#     replies.map { |reply| new(reply) }
#   end
#
#   def self.find_by_question_id(question_id)
#     replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
#       SELECT * FROM replies WHERE question_id = ?
#     SQL
#     replies.map { |reply| new(reply) }
#   end
#
#   def self.find_by_id(id)
#     reply = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT * FROM replies WHERE id = ?
#     SQL
#     new(reply.first)
#   end
#
#   def initialize(options)
#     @id = options['id']
#     @question_id = options['question_id']
#     @parent_id = options['parent_id']
#     @user_id = options['user_id']
#     @body = options['body']
#   end
#
#   def author
#     User.find_by_id(@user_id)
#   end
#
#   def question
#     Question.find_by_id(@id)
#   end
#
#   def parent_reply
#     Reply.find_by_id(@parent_id)
#   end
#
#   def create
#     raise "#{self} already in database" if @id
#     QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body)
#       INSERT INTO
#         replies (question_id, parent_id, user_id, body)
#       VALUES
#         (?, ?, ?, ?)
#     SQL
#     @id = QuestionsDatabase.instance.last_insert_row_id
#   end
#
#   def update
#     raise "#{self} not in database" unless @id
#     QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body, @id)
#       UPDATE
#         replies
#       SET
#         question_id = ?, parent_id = ?, user_id = ?, body = ?
#       WHERE
#         id = ?
#     SQL
#   end
# end
