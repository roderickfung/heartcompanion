class CreatePatientLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_logs do |t|
      t.date :date
      t.integer :heartrate
      t.integer  :bp_hi
      t.integer  :bp_low
      t.integer  :weight_num
      t.string   :weight_type
      t.integer   :exerting_breath
      t.integer   :night_breath
      t.integer   :leg_swollen
      t.integer  :lightheadedness
      t.references :patient, foreign_key: true

      t.timestamps
    end
    add_index :patient_logs, [:heartrate, :weight_type]
    add_index :patient_logs, [:bp_hi, :bp_low, :weight_num]
    add_index :patient_logs, [:night_breath, :exerting_breath]
    add_index :patient_logs, [:leg_swollen, :lightheadedness]
  end
end
