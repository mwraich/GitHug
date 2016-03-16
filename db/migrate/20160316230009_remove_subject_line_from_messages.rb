class RemoveSubjectLineFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :subject_line, :string 
  end
end
