class AddIntroFieldToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :intro, :text
  end
end
