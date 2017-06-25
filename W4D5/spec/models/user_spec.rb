# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  cheer_count     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(username: 'hfeger', password_digest: 'asfesfwefasfsr', session_token: 'asfrfsdsgasg', cheer_count: 500) }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:cheer_count) }

    it { should validate_uniqueness_of(:username)}
  end

  describe 'assocations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
    it { should have_many(:cheers) }
  end
end
