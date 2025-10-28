class AddLongitudeAndLatitudeToOffers < ActiveRecord::Migration[8.0]
  def change
    add_column :offers, :longitude, :float
    add_column :offers, :latitude, :float
  end
end
