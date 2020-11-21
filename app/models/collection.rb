class Collection < ApplicationRecord
  enum status: { private: 0, public: 1 }, _prefix: :status, _default: 1

  belongs_to :user
  has_many :recipe_collections
  has_many :recipes, through: :recipe_collections
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
