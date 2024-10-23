require "rails_helper"

RSpec.describe User do
  context "associations" do
    it { is_expected.to have_one(:patient_profile) }
    it { is_expected.to have_one(:doctor_profile) }
  end

  context "validations" do
    subject { build(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
