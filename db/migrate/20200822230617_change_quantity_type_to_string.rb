class ChangeQuantityTypeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :measures, :quantity, :string
  end
end
