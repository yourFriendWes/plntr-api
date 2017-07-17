class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table(:schedules) do |t|
      t.column(:zone_id, :integer)
      t.column(:plant_id, :integer)
      t.column(:start_seed_indoors, :string)
      t.column(:plant_outdoors, :string)
      t.column(:spring_planting, :string)
      t.column(:fall_planting, :string)

      t.timestamps()
    end
  end
end
