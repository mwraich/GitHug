class ChangeMessageColumn < ActiveRecord::Migration
  def change
    rename_column :messages, :sender, :profile_id
  end
end
