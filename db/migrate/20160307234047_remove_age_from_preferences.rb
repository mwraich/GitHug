class RemoveAgeFromPreferences < ActiveRecord::Migration
  def change
    remove_column :preferences, :age, :integer
    add_column :preferences, :min_age, :integer
    add_column :preferences, :max_age, :integer
  end
end
