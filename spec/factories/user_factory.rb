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
#  bio                    :text
#  website                :string
#  photo                  :string
#
require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5..15).gsub(/\W/, "_") }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    admin { false }

    factory :admin do
      admin { true }
    end
  end
end
