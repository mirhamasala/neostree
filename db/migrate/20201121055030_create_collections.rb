class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :title
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
