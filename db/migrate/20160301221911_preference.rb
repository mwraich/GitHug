class Preference < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :location
      t.boolean :male
      t.boolean :female
      t.boolean :other
      t.integer :age
      t.string :operating_system
      t.boolean :partner
      t.boolean :paired_programmer

      t.timestamps null: false
  end
end
end
