# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  title      :string
#  source     :string
#  photo      :string
#  notes      :text
#  prep_time  :integer
#  cook_time  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  intro      :text
#  user_id    :bigint           not null
#  yield      :integer
#  yield_type :integer
#  status     :integer
#
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'shows user\'s recipes' do
    user1 = User.create!(first_name: 'User1', username: 'user1', email: 'user1@me.com', password: '123456')
    user2 = User.create!(first_name: 'User2', username: 'user2', email: 'user2@me.com', password: '123456')

    recipe1 = Recipe.create!(title: 'Avocado Smoothie', user: user1)
    recipe2 = Recipe.create!(title: 'Coconut Smoothie', user: user1)
    recipe3 = Recipe.create!(title: 'Strawberry Smoothie', user: user2)

    expect(Recipe.author(user1)).to eq([recipe1, recipe2])
    expect(Recipe.author(user2)).to eq([recipe3])
  end
end
