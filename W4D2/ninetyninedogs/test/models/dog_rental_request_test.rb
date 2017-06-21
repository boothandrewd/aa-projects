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

require 'test_helper'

class DogRentalRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
