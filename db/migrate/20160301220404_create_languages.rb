class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.integer :skill_level

      t.timestamps null: false
    end
  end
end
