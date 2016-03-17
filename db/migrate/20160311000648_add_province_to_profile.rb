class AddProvinceToProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :location, :city
    add_column :profiles, :province, :string
  end
end
