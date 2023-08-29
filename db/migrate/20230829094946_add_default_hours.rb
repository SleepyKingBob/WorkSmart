class AddDefaultHours < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :hours_worked, :integer, default: 0
  end
end
