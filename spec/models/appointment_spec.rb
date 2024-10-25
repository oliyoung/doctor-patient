# == Schema Information
#
# Table name: appointments
#
#  id                 :uuid             not null, primary key
#  doctor_profile_id  :uuid             not null
#  patient_profile_id :uuid             not null
#  appointment_at     :datetime
#  clinic             :string
#  purpose            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:doctor_profile) }
    it { is_expected.to belong_to(:patient_profile) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:appointment_at) }
    it { is_expected.to validate_presence_of(:clinic) }
    it { is_expected.to validate_presence_of(:purpose) }
  end
end
