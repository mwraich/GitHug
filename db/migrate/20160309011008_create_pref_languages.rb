class CreatePrefLanguages < ActiveRecord::Migration
  def change
    create_table :pref_languages do |t|
          t.string :pref_lang
          t.integer :skill_level
          t.integer :preference_id
          t.timestamps null: false
    end
  end
end
