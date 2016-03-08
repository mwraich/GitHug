class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
        t.integer :blocker_id
        t.integer :blocked_id
      t.timestamps null: false
      index: true
    end
  end
end
