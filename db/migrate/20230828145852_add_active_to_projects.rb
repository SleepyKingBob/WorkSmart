class AddActiveToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :active, :boolean, default: false
  end
end
