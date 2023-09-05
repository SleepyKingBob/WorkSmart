class EditHoursType < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :hours_worked, :float, precision: 1
  end
end
