class ChangeFieldNameInPlants < ActiveRecord::Migration[5.1]
  def change
    rename_column :plants, :type, :plant_type
  end
end
