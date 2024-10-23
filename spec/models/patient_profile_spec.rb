require "rails_helper"

RSpec.describe PatientProfile do
  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:patient_checkins).dependent(:destroy) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age) }
  end

  context "delegations" do
    it { is_expected.to delegate_method(:first_name).to(:user) }
    it { is_expected.to delegate_method(:last_name).to(:user) }
  end
end
