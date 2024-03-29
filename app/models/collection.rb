class Collection < ApplicationRecord
  enum status: { private: 0, public: 1 }, _prefix: :status, _default: 0

  validates :title, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :recipe_collections, dependent: :destroy
  has_many :recipes, -> { alphabetize }, through: :recipe_collections

  scope :alphabetize, -> { order(:title) }
end

# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  title      :string
#  status     :integer
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
