# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  name                   :string
#  admin_since            :datetime
#
require 'rails_helper'

RSpec.describe User, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  describe 'admin' do
    it 'starts as a regular user' do
      user = User.new

      expect(user.admin?).to eql(false)
      expect(user.admin_since).to eql(nil)
    end

    it 'becomes an admin' do
      freeze_time do
        user = build(:user)
        user.admin = true

        expect(user.admin?).to eql(true)
        expect(user.admin_since).to eql(Time.current)
      end
    end

    it 'becomes a regular user' do
      user = build(:admin)
      user.admin = false

      expect(user.admin?).to eql(false)
      expect(user.admin_since).to eql(nil)
    end
  end

  describe 'author of recipe' do
    it 'is owner of recipe' do
      user = create(:user)

      recipe = create(:recipe, user: user)
      recipe2 = create(:recipe)

      expect(user.author_of?(recipe)).to eql(true)
      expect(user.author_of?(recipe2)).to eql(false)
    end
  end
end
