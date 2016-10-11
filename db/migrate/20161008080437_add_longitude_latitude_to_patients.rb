class AddLongitudeLatitudeToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :longitude, :float
    add_column :patients, :latitude, :float
  end
end
