# == Schema Information
#
# Table name: patient_profiles
#
#  id               :uuid             not null, primary key
#  user_id          :uuid             not null
#  age              :integer          not null
#  phone_number     :string(10)
#  starting_weight  :float
#  goal_weight      :float
#  height_in_inches :integer
#  date_of_birth    :date
#  next_checkin     :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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
