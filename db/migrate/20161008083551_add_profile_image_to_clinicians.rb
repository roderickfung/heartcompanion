class AddProfileImageToClinicians < ActiveRecord::Migration[5.0]
  def change
    add_column :clinicians, :profile_image, :string
  end
end
