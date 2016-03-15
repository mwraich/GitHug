class ChangePartnerColumnOnUser < ActiveRecord::Migration
  def change
      rename_column :profiles, :partner, :date
  end
end
