class AddPrepMethodFieldToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :prep_method, :string
  end
end
