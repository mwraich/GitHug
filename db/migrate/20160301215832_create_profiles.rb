class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.boolean :male
      t.boolean :female
      t.boolean :other
      t.date :birthday
      t.string :operating_system
      t.text :about_me

      t.timestamps null: false
    end
  end
end
