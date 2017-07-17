class AddTrangeToZipcodes < ActiveRecord::Migration[5.1]
  def change
    add_column(:zipcodes, :temp_range, :string)
  end
end
