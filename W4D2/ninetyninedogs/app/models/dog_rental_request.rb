# == Schema Information
#
# Table name: dog_rental_requests
#
#  id         :integer          not null, primary key
#  dog_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DogRentalRequest < ApplicationRecord
  VALID_STATI = %w(PENDING APPROVED DENIED)

  validates :dog_id, :start_date, :end_date, :status, presence: true

  validates :status, inclusion: {
    in: VALID_STATI,
    message: "%{value} is not a valid status"
  }

  validate :overlaps_approved_request

  belongs_to :dog,
    primary_key: :id,
    foreign_key: :dog_id,
    class_name: :Dog

  def overlapping_requests
    DogRentalRequest
      .where("id != ?", id)
      .where("dog_id = ?", dog_id)
      .where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", start_date, end_date, start_date, end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def overlaps_approved_request
    if overlapping_approved_requests.exists?
      errors.add(:request, "can't overlap other requests")
    end
  end
end
