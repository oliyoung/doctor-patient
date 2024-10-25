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
class PatientProfile < ApplicationRecord
  belongs_to :user
  has_many :patient_checkins, dependent: :destroy

  validates :age, numericality: true, presence: true

  delegate :first_name, to: :user
  delegate :last_name, to: :user
end
