# == Schema Information
#
# Table name: shared_artworks
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SharedArtwork < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: {
    scope: :viewer_id,
    message: 'Already Shared'
  }

  belongs_to :artwork
  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User
end
