# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments
end
