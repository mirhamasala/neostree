class RemoveServingsFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :servings, :integer
  end
end
