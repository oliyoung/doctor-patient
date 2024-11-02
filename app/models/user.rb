# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :patient_profile, required: false
  has_one :doctor_profile, required: false

  has_and_belongs_to_many :conversations
  has_many :messages

  validates(
    :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true,
    uniqueness: { case_sensitive: false }
  )
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
      [first_name, last_name].join(" ")
  end

  def to_s
    name
  end
end
