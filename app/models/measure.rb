class Measure < ApplicationRecord
  acts_as_list scope: :recipe

  UNITS=%w[
    cup
    teaspoon
    tablespoon
    liter
    milliliter
    handful
    splash
    sprig
    dash
    bunch
    drop
    packet
    piece
    pinch
    shot
    gram
    tin
    can
    stick
    thumb
  ]

  validates :ingredient, presence: true

  belongs_to :recipe

  def unit=(value)
    new_value = value.to_s.downcase.singularize

    raise "Invalid unit '#{new_value}'" unless UNITS.include?(new_value)

    write_attribute(:unit, new_value)
  end

  def to_s
    DisplayMeasure.new(quantity, unit, ingredient, prep_method).to_s
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
#  unit        :string
#
