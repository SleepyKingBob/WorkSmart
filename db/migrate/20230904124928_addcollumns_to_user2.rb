class AddcollumnsToUser2 < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
     t.string  :access_token
     t.integer :expires_at
     t.string  :refresh_token
    end
  end
end
