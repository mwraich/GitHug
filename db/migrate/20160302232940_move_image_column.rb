class MoveImageColumn < ActiveRecord::Migration
  def change
    remove_column :users, :image
    add_column :profiles, :image, :string
  end
end
