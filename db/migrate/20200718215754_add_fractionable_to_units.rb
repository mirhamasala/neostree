class AddFractionableToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :fractionable, :boolean
  end
end
