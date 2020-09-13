class AddUnitToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :unit, :string
  end
end
