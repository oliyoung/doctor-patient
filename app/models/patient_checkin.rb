# == Schema Information
#
# Table name: patient_checkins
#
#  id                    :uuid             not null, primary key
#  patient_profile_id    :uuid             not null
#  appointment_date      :datetime         not null
#  side_effects          :text
#  questions_for_doctor  :text
#  wants_to_change_dose  :boolean
#  current_weight        :float
#  doctor_profile_id     :uuid             not null
#  medication_prescribed :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class PatientCheckin < ApplicationRecord
  belongs_to :patient_profile, optional: false
  belongs_to :doctor_profile, optional: false

  validates :appointment_date, presence: true
end
