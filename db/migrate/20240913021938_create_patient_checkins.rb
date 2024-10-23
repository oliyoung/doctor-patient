class CreatePatientCheckins < ActiveRecord::Migration[7.2]
  def change
    create_table :patient_checkins, id: :uuid do |t|
      t.belongs_to :patient_profile, null: false, foreign_key: true, type: :uuid
      t.references :doctor_profile, null: false, foreign_key: true, type: :uuid
      t.timestamp :appointment_date, null: false
      t.text :side_effects
      t.text :questions_for_doctor
      t.boolean :wants_to_change_dose
      t.float :current_weight
      t.text :medication_prescribed

      t.timestamps
    end
  end
end
