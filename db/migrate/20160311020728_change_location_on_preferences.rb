class ChangeLocationOnPreferences < ActiveRecord::Migration
  def change
      rename_column :preferences, :location, :city
      add_column :preferences, :province, :string
  end
end
