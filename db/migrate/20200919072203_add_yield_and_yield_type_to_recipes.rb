class AddYieldAndYieldTypeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :yield, :integer
    add_column :recipes, :yield_type, :integer
    add_index :recipes, :yield_type
  end
end
