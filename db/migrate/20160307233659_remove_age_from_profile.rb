class RemoveAgeFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :age, :integer
    add_column :profiles, :min_age, :integer
    add_column :profiles, :max_age, :integer
  end
end
