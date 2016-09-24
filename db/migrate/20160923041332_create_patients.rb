class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :role, default: 'patient'
      t.string :care_id
      t.string :first_name
      t.string :last_name
      t.boolean :sex
      t.integer :age
      t.string :email
      t.string :phone
      t.text :address
      t.string :password_digest
      t.string :remember_digest
      t.string :confirmation_digest
      t.boolean :approved

      t.integer :bphigh
      t.integer :bplow
      t.integer :hrhigh
      t.integer :hrlow
      t.integer :lbhigh
      t.integer :lblow

      t.timestamps
      t.references :clinicians, foreign_key: true
    end
  add_index :patients, [:care_id, :email]
  add_index :patients, [:bphigh, :bplow]
  add_index :patients, [:hrhigh, :hrlow]
  add_index :patients, [:lbhigh, :lblow]
  end
end
