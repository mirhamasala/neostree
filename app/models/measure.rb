class Measure < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :unit
  belongs_to :ingredient
  belongs_to :recipe
end
