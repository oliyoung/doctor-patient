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
class Appointment < ApplicationRecord
  belongs_to :doctor_profile
  belongs_to :patient_profile

  validates :appointment_at, presence: true
  validates :clinic, presence: true
  validates :purpose, presence: true
end
