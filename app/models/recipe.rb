class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :steps, dependent: :destroy
  has_many :measures, dependent: :destroy
end
