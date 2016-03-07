class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
      t.integer :blocker_id, index: true
      t.integer :blocked_id, index: true
    end

  end
end
