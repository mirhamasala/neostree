class Measure < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :unit
  belongs_to :ingredient
  belongs_to :recipe
end

# == Schema Information
#
# Table name: measures
#
#  id            :bigint           not null, primary key
#  quantity      :integer
#  unit_id       :bigint           not null
#  ingredient_id :bigint           not null
#  recipe_id     :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
