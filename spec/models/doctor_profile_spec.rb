# == Schema Information
#
# Table name: doctor_profiles
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  state      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
