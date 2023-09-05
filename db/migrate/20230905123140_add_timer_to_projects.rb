class AddTimerToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :start_count, :date
    add_column :projects, :end_count, :date
  end
end
