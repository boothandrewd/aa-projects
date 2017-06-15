class Visit < ApplicationRecord
  validates :user_id, :surl_id, presence: true

  def self.record_visit!(user, shortened_url)
    create! user_id: user.id, surl_id: shortened_url.id
  end

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visitee,
    primary_key: :id,
    foreign_key: :surl_id,
    class_name: :ShortenedUrl
end
