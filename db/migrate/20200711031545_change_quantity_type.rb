class ChangeQuantityType < ActiveRecord::Migration[6.0]
  def change
    change_column :measures, :quantity, :float
  end
end
