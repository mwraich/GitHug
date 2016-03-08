class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :subject_line, :string
    add_column :messages, :read_status, :boolean
  end
end
