class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table(:plants) do |t|
      t.column(:type, :string)
      t.column(:name, :string)
      t.column(:sun_exposure, :string)
      t.column(:soil_ph, :string)
      t.column(:soil_type, :string)
      t.column(:soil_drainage, :string)
      t.column(:water_requirement, :string)
      t.column(:depth, :string)
      t.column(:row_spacing, :string)
      t.column(:plant_spacing, :string)
      t.column(:description, :text)

      t.timestamps()
    end
  end
end
