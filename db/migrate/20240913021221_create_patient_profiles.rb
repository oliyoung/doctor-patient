class CreatePatientProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :patient_profiles, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid, index: true
      t.integer :age, null: false
      t.string :phone_number, limit: 10
      t.float :starting_weight
      t.float :goal_weight
      t.integer :height_in_inches
      t.date :date_of_birth
      t.date :next_checkin

      t.timestamps
    end
  end
end
