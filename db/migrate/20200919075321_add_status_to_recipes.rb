class AddStatusToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :status, :integer
    add_index :recipes, :status
  end
end
