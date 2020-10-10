class AddWebsiteBioPhotoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :website, :string
    add_column :users, :photo, :string
  end
end
