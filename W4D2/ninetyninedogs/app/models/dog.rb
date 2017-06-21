# == Schema Information
#
# Table name: dogs
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dog < ApplicationRecord
  VALID_COLORS = %w(brown blonde black grey gray spotted)

  validates :birth_date, :color, :name, :sex, presence: true

  validates :color, inclusion: {
    in: VALID_COLORS,
    message: "%{value} is not a valid color"
  }

  validates :sex, inclusion: {
    in: %w(M F),
    message: "%{value} is not a valid sex"
  }

  has_many :requests,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :dog_id,
    class_name: :DogRentalRequest

  def age
    DateTime.now.year - birth_date.year
  end
end
