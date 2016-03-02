class ChangeUserIdColumnPreferences < ActiveRecord::Migration
  def change
    rename_column :preferences, :user_id, :profile_id
  end
end
