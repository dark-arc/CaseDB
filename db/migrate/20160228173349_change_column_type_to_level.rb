class ChangeColumnTypeToLevel < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :type, :level
  end
end
