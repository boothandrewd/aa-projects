# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks, dependent: :destroy,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :views,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :SharedArtwork

  has_many :shared_artworks,
    through: :views,
    source: :artwork
  has_many :comments, dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment
end
