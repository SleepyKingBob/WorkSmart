class AddColumnToUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :break_time, :integer
  end
end
