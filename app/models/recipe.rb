class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :steps, dependent: :destroy
  has_many :measures, dependent: :destroy
end

# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  title      :string
#  link       :string
#  photo      :string
#  notes      :text
#  prep_time  :integer
#  cook_time  :integer
#  servings   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
