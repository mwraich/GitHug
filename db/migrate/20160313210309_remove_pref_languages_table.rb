class RemovePrefLanguagesTable < ActiveRecord::Migration
  def change
    drop_table :pref_languages
  end
end
