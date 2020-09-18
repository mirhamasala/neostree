class Recipe < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  has_many :steps, dependent: :destroy, inverse_of: :recipe
  has_many :measures, dependent: :destroy, inverse_of: :recipe
  belongs_to :user

  accepts_nested_attributes_for :measures, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  scope :alphabetize, -> { order(:title) }
end

# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  title      :string
#  source     :string
#  photo      :string
#  notes      :text
#  prep_time  :integer
#  cook_time  :integer
#  servings   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  intro      :text
#  user_id    :bigint
#
