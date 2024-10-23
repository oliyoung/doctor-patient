require "rails_helper"

RSpec.describe DoctorProfile do
  context "associations" do
    it { is_expected.to belong_to(:user) }
  end

  context "delegations" do
    it { is_expected.to delegate_method(:first_name).to(:user) }
    it { is_expected.to delegate_method(:last_name).to(:user) }
  end
end
