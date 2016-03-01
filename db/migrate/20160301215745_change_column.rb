class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :users, :first_name, :username
  end
end
