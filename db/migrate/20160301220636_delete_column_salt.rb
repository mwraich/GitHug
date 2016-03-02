class DeleteColumnSalt < ActiveRecord::Migration
  def change
    remove_column :users, :salt
  end
end
