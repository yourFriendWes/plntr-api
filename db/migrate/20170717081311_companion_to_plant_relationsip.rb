class CompanionToPlantRelationsip < ActiveRecord::Migration[5.1]
  def change
    add_reference :companions, :plant, foreign_key: true
  end
end
