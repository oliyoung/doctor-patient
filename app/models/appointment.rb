# == Schema Information
#
# Table name: appointments
#
#  id                 :uuid             not null, primary key
#  doctor_profile_id  :uuid             not null
#  patient_profile_id :uuid             not null
#  appointment_at     :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  clinic             :integer          default("Asgard")
#  purpose            :integer          default("checkup")
#
class Appointment < ApplicationRecord
  belongs_to :doctor_profile
  belongs_to :patient_profile

  has_many :notes

  validates :appointment_at, presence: true
  validates :clinic, presence: true
  validates :purpose, presence: true

  enum :clinic, [
    "Asgard",
    "Attilan",
    "Genosha",
    "K'un-Lun",
    "Knowhere",
    "Krakoa",
    "Latveria",
    "Savage Land",
    "The Raft",
    "Wakanda"]
  enum :purpose, ["checkup", "vaccination", "diagnosis", "treatment", "referral"]
end
