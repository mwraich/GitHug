class ChangeUserIdColumn < ActiveRecord::Migration
  def change
    rename_column :images, :user_id, :profile_id
  end
end
