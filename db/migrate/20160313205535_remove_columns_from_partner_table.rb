class RemoveColumnsFromPartnerTable < ActiveRecord::Migration
  def change
    remove_column :partners, :partner
    remove_column :partners, :paired_programmer
  end
end
