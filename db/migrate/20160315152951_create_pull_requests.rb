class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer  :requestor
      t.integer  :requestee
      t.boolean :permission
      t.timestamps null: false
    end
  end
end
