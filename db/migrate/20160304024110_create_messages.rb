class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient
      t.integer :sender
      t.text :message

      t.timestamps null: false
    end
  end
end
