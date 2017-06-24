# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  band_id        :integer          not null
#  recording_type :string           default("studio"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name           :string           not null
#

class Album < ApplicationRecord
  validates :band_id, :recording_type, presence: true

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
