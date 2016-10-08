class AddCityProvincePostalCodeToClinicians < ActiveRecord::Migration[5.0]
  def change
    add_column :clinicians, :city, :string
    add_column :clinicians, :province, :string
    add_column :clinicians, :postal_code, :string
  end
end
