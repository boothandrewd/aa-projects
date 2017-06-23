# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :bonus, presence: true

  belongs_to :album
  
  has_one :band,
    through: :album,
    source: :band
end
