class ChangeDateColumnsToDatetime < ActiveRecord::Migration[7.0]
  def up
    change_column :projects, :start_date, :datetime
    change_column :projects, :dead_line, :datetime
  end

  def down
    change_column :projects, :start_date, :date
    change_column :projects, :dead_line, :date
  end
end




