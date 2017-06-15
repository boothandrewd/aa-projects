class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :surl_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :distinct_visitors, -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    loop do
      rand_num = SecureRandom.urlsafe_base64(0.75 * 16)
      return rand_num unless exists? short_url: rand_num
    end
  end

  def self.create_short_url(user, long_url)
    create! user_id: user.id, long_url: long_url, short_url: random_code
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    distinct_visitors.count
  end

  # def num_uniques
  #   visitors.select(:id).distinct.count
  # end

  def num_recent_uniques
    distinct_visitors.where(["visits.updated_at >= ?", 10.minutes.ago]).count
  end
end
