class ChangePreferencesTableName < ActiveRecord::Migration
  def change
    rename_table :preferences, :partners
  end
end
