class UpdateColumnNamesMessage < ActiveRecord::Migration
  def change
    rename_column :messages, :profile_id, :sender_id
    rename_column :messages, :recipient, :recipient_id
  end
end
