class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :profiles, :image 
  end
end
