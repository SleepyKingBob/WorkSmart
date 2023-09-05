class DropSettings < ActiveRecord::Migration[7.0]
  def change
    drop_table :settings
  end
end
