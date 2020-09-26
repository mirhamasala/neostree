require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    admin { false }

    factory :admin do
      admin { true }
    end
  end
end
