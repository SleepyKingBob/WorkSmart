class EditStartCountType < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :start_count, :timestamp
    change_column :projects, :end_count, :timestamp
  end
end
