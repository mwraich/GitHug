class AddPermissiontoMessages < ActiveRecord::Migration
  def change
    add_column :messages, :permission, :boolean, :default => false
  end
end
