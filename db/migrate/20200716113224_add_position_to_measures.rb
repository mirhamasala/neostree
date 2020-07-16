class AddPositionToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :position, :integer
  end
end
