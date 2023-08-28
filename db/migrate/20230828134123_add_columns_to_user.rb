class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :work_hours, :integer
    add_column :users, :projects_for_week, :string
  end
end
