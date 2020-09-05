class AddIngredientToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :ingredient, :string
  end
end
