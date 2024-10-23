class PatientCheckin < ApplicationRecord
  belongs_to :patient_profile, optional: false
  belongs_to :doctor_profile, optional: false

  validates :appointment_date, presence: true
end
