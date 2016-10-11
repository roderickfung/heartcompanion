class AddProfileImageToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :profile_image, :string
  end
end
