class AddMinAgeMaxAgeToPairProgrammer < ActiveRecord::Migration
  def change
    rename_column :pair_programmers, :age, :min_age
    add_column :pair_programmers, :max_age, :integer
    add_column :pair_programmers, :profile_id, :integer
  end
end
