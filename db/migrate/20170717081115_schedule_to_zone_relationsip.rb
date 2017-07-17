class ScheduleToZoneRelationsip < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :zone, foreign_key: true
  end
end
