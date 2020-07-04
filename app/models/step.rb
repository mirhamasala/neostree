class Step < ApplicationRecord
  validates :description, presence: true

  belongs_to :recipe
end
