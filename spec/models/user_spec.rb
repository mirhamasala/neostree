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
#  first_name             :string
#  last_name              :string
#  admin_since            :datetime
#
require 'rails_helper'

RSpec.describe User, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  describe 'admin' do
    it 'starts as a regular user' do
      user = build(:user)

      expect(user.admin?).to eql(false)
      expect(user.admin_since).to eql(nil)
    end

    it 'becomes an admin' do
      freeze_time do
        user = build(:admin)

        expect(user.admin?).to eql(true)
        expect(user.admin_since).to eql(Time.current)
      end
    end

    it 'switches back to a regular user' do
      user = build(:admin)
      user.admin = false

      expect(user.admin?).to eql(false)
      expect(user.admin_since).to eql(nil)
    end
  end

  describe 'author of recipe' do
    it 'is owner of recipe' do
      user = build(:user)

      recipe1 = build(:recipe)
      recipe2 = build(:recipe)

      user.recipes = [recipe1, recipe2]

      expect(user.author_of?(recipe1)).to eql(true)
    end

    it 'is not owner of recipe' do
      user = build(:user)

      recipe1 = build(:recipe)
      recipe2 = build(:recipe)

      user.recipes = [recipe2]
      expect(user.author_of?(recipe1)).to eql(false)
    end
  end
end
