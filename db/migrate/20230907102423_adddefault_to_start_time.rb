class AdddefaultToStartTime < ActiveRecord::Migration[7.0]
  def change
    change_column :schedules, :start_time, :time, default: Time.parse("08:00")
  end
end
