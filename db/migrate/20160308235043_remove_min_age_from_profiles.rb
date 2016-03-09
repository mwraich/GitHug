class RemoveMinAgeFromProfiles < ActiveRecord::Migration
  def change
      remove_column :profiles, :min_age, :integer
      remove_column :profiles, :max_age, :integer
  end
end
