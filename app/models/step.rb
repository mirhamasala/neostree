class Step < ApplicationRecord
  acts_as_list

  validates :position, presence: true, uniqueness: { scope: :recipe_id }
  validates :description, presence: true
  validates :recipe_id, presence: true

  belongs_to :recipe
end

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  position    :integer
#  description :text
#  recipe_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
