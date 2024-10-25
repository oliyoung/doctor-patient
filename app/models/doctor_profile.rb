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
class DoctorProfile < ApplicationRecord
  belongs_to :user

  delegate :first_name, to: :user
  delegate :last_name, to: :user
end
