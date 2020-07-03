class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :link
      t.string :photo
      t.text :notes
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings

      t.timestamps
    end
  end
end
