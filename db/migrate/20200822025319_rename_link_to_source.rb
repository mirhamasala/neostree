class RenameLinkToSource < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :link, :source
  end
end
