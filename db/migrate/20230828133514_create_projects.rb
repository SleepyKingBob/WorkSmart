class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :dead_line
      t.integer :hours_worked
      t.boolean :active
      t.integer :expected_hours
      t.boolean :completed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
