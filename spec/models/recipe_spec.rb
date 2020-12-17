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
  it 'starts as a draft' do
    recipe = Recipe.new

    expect(recipe.status).to eq('draft')
    expect(recipe.status_draft?).to eq(true)
  end

  it 'becomes published' do
    recipe = build(:draft_recipe)

    recipe.status_published!

    expect(recipe.status).to eq('published')
    expect(recipe.status_published?).to eq(true)
  end

  it 'becomes a draft' do
    recipe = build(:published_recipe)

    recipe.status_draft!

    expect(recipe.status).to eq('draft')
    expect(recipe.status_draft?).to eq(true)
  end
end
