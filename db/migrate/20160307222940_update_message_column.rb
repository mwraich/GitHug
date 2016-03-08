class UpdateMessageColumn < ActiveRecord::Migration
  def change
    change_column :messages, :read_status, :boolean, :default => false
  end
end
