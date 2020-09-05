class RemoveIngredientIdFromMeasures < ActiveRecord::Migration[6.0]
  def change
    remove_column :measures, :ingredient_id, :integer
  end
end
