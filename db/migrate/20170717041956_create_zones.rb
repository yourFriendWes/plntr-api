class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table(:zones) do |t|
      t.column(:main_zone, :string)
      t.column(:lowest_avg_temp_from, :string)
      t.column(:lowest_avg_temp_to, :string)
      t.column(:description, :text)

      t.timestamps()
    end
  end
end
