class ChangeFieldDataTypeInPlant < ActiveRecord::Migration[5.1]
  def change
    change_column :plants, :row_spacing, :string
    change_column :plants, :plant_spacing, :string
    change_column :plants, :depth, :string
  end
end
