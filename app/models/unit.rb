class Unit < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def name=(new_name)
    return unless new_name

    write_attribute(:name, new_name.downcase.singularize)
  end

  def self.alphabetize
    order(name: :asc)
  end
end

# == Schema Information
#
# Table name: units
#
#  id           :bigint           not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  fractionable :boolean
#
