class Recipe < ApplicationRecord
  enum yield_type: { makes: 0, serves: 1 }, _suffix: true
  enum status: { draft: 0, published: 1 }, _prefix: :status, _default: 0

  validates :title, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :steps, dependent: :destroy, inverse_of: :recipe
  has_many :measures, dependent: :destroy, inverse_of: :recipe
  has_many :recipe_collections
  has_many :collections, through: :recipe_collections

  has_one_attached :photo

  accepts_nested_attributes_for :measures, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  scope :alphabetize, -> { order(:title) }
  scope :for_user, -> (user) {
    where(user: user).or(where(status: :published))
  }

  def self.author(user)
    where(user: user)
  end
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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  intro      :text
#  user_id    :bigint           not null
#  yield      :integer
#  yield_type :integer
#  status     :integer
#
