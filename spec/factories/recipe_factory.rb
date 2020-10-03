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
