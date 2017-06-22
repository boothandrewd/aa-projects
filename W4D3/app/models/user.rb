# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  # validates :session_token, uniqueness: true

  has_many :sessions

  has_many :cat_rental_requests

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat

  def self.find_by_session(session_token)
    session=Session.find_by(session_token: session_token)
    session.user
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64[0...16]
    self.save!
    self.session_token
  end

  def password=(password)
    digest = BCrypt::Password.create(password)
    self.password_digest = digest
    # self.save!
    # self.password_digest
  end

  def is_password?(password)
    digest = self.password_digest
    BCrypt::Password.new(digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
end
