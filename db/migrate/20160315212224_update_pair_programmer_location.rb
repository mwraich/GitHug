class UpdatePairProgrammerLocation < ActiveRecord::Migration
  def change
    rename_column :pair_programmers, :location, :city
    add_column :pair_programmers, :province, :string
  end
end
