class AddCityProvinceAndPostalCodeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :city, :string
    add_column :patients, :provice, :string
    add_column :patients, :postal_code, :string
  end
end
