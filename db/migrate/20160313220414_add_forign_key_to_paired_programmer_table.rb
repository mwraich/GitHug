class AddForignKeyToPairedProgrammerTable < ActiveRecord::Migration
  def change
    add_column :pair_programmers, :profile_id, :integer
  end
end
