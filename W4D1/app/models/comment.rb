class Comment < ApplicationRecord
  validates :artwork_id, :user_id, :body, presence: true
  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
