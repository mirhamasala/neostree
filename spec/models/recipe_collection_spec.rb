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
require 'rails_helper'

RSpec.describe RecipeCollection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
