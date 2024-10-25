class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments, id: :uuid do |t|
      t.references :doctor_profile, null: false, foreign_key: true, type: :uuid
      t.references :patient_profile, null: false, foreign_key: true, type: :uuid
      t.datetime :appointment_at
      t.string :clinic
      t.string :purpose

      t.timestamps
    end
  end
end
