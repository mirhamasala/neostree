class ChangeUnitColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :measures, :unit_id, true
  end
end
