# == Schema Information
#
# Table name: measures
#
#  id            :bigint           not null, primary key
#  quantity      :integer
#  unit_id       :bigint
#  ingredient_id :bigint           not null
#  recipe_id     :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Measure, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
