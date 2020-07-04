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
require 'rails_helper'

RSpec.describe Step, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
