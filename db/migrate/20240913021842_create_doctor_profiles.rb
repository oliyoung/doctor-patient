class CreateDoctorProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :doctor_profiles, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid, index: true
      t.text :state

      t.timestamps
    end
  end
end
