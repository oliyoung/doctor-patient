class PatientProfile < ApplicationRecord
  belongs_to :user
  has_many :patient_checkins, dependent: :destroy

  validates :age, numericality: true, presence: true

  delegate :first_name, to: :user
  delegate :last_name, to: :user
end
