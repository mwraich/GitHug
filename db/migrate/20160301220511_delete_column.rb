class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column :users, :crypted_password
  end
end
