class CreateZipcodes < ActiveRecord::Migration[5.1]
  def change
    create_table(:zipcodes) do |t|
      t.column(:zip, :string)
      t.column(:phzone, :string)

      t.timestamps()
    end
  end
end
