class CreateCompanions < ActiveRecord::Migration[5.1]
  def change
    create_table(:companions) do |t|
      t.column(:plant_id, :integer)
      t.column(:compatible, :string)
      t.column(:combative, :string)

      t.timestamps()
    end
  end
end
