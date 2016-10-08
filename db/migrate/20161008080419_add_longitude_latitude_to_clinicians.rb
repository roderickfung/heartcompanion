class AddLongitudeLatitudeToClinicians < ActiveRecord::Migration[5.0]
  def change
    add_column :clinicians, :longitude, :float
    add_column :clinicians, :latitude, :float
  end
end
