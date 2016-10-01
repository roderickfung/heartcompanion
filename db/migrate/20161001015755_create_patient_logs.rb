class CreatePatientLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_logs do |t|

      t.timestamps
    end
  end
end
