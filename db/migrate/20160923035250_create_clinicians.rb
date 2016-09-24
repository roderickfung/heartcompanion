class CreateClinicians < ActiveRecord::Migration[5.0]
  def change
    create_table :clinicians do |t|
      t.string :role, default: 'clinician'
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :approved, default: false

      t.timestamps
    end
    add_index :clinicians, [:username, :email]
  end
end
