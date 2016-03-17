class CreatePairProgrammers < ActiveRecord::Migration
  def change
    create_table :pair_programmers do |t|
      t.string :location
      t.boolean :male
      t.boolean :female
      t.boolean :other
      t.integer :age
      t.string :operating_system
      t.timestamps null: false
    end
  end
end
