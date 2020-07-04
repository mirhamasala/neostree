class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :measures, dependent: :destroy
end
