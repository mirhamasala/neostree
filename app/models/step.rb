class Step < ApplicationRecord
  acts_as_list scope: :recipe

  validates :description, presence: true

  belongs_to :recipe

  scope :ordered, -> { order(:position) }
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
