class RecipeCollection < ApplicationRecord
  belongs_to :recipe
  belongs_to :collection
end

# == Schema Information
#
# Table name: recipe_collections
#
#  id            :bigint           not null, primary key
#  recipe_id     :bigint           not null
#  collection_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
