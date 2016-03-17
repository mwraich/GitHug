class UpateProfileTable < ActiveRecord::Migration
  def change
    add_column :profiles, :partner, :boolean, :default => false
    add_column :profiles, :paired_programmer, :boolean, :default => false
  end
end
