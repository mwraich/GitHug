class ChangeUserIdColumnLangugages < ActiveRecord::Migration
  def change
    rename_column :languages, :user_id, :profile_id
  end
end
