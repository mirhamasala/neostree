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
FactoryBot.define do
  factory :recipe do
    association :user

    title { Faker::Food.dish }

    status { Recipe.statuses.keys.sample }

    factory :draft_recipe do
      status { :draft }
    end

    factory :published_recipe do
      status { :published }
    end
  end
end
