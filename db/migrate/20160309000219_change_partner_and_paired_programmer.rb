class ChangePartnerAndPairedProgrammer < ActiveRecord::Migration
  def change
    change_column :preferences, :partner, :boolean, :default => false
    change_column :preferences, :paired_programmer, :boolean, :default => false
  end
end
