class Collection < ApplicationRecord
  belongs_to :user
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
