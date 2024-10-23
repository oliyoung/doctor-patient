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
