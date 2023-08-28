class RemoveActiveFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :active, :boolean
  end
end
