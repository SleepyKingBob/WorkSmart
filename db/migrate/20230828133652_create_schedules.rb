class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.time :end_time
      t.time :lunch_break
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
