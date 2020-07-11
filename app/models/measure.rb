class Measure < ApplicationRecord
  validates :quantity, presence: true
  validates :unit_id, presence: true, allow_blank: true
  validates :ingredient_id, presence: true
  validates :recipe_id, presence: true

  belongs_to :unit, optional: true
  belongs_to :ingredient
  belongs_to :recipe
end

# == Schema Information
#
# Table name: measures
#
#  id            :bigint           not null, primary key
#  quantity      :integer
#  unit_id       :bigint
#  ingredient_id :bigint           not null
#  recipe_id     :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
