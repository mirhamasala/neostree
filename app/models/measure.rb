class Measure < ApplicationRecord
  acts_as_list scope: :recipe

  validates :ingredient, presence: true

  belongs_to :unit, optional: true
  belongs_to :recipe

  def to_s
    DisplayMeasure.new(quantity, unit, ingredient).to_s
  end
end

# == Schema Information
#
# Table name: measures
#
#  id          :bigint           not null, primary key
#  quantity    :string
#  unit_id     :bigint
#  recipe_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer
#  ingredient  :string
#  prep_method :string
#
