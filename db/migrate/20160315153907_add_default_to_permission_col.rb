class AddDefaultToPermissionCol < ActiveRecord::Migration
  def change
    change_column :pull_requests, :permission, :boolean, :default => false
  end
end
