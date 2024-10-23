class User < ApplicationRecord
  has_one :patient_profile, required: false
  has_one :doctor_profile, required: false

  validates(
    :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true,
    uniqueness: { case_sensitive: false }
  )
  validates :first_name, presence: true
  validates :last_name, presence: true
end
