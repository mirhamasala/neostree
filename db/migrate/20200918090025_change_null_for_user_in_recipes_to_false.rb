class ChangeNullForUserInRecipesToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:recipes, :user_id, false)
  end
end
