class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
