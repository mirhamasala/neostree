FactoryBot.define do
  factory :recipe do
    association :user

    title { Faker::Food.dish }
  end
end
