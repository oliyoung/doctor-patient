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
require "rails_helper"

RSpec.describe PatientCheckin do
  context "associations" do
    it { is_expected.to belong_to(:patient_profile).required }
    it { is_expected.to belong_to(:doctor_profile).required }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:appointment_date) }
  end
end
