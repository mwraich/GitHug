class AddLongLatToPrefModels < ActiveRecord::Migration
  def change
    add_column  :partners, :latitude, :float
    add_column  :partners, :longitude, :float
    add_column  :pair_programmers, :latitude, :float
    add_column  :pair_programmers, :longitude, :float
  end
end
