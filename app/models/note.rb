# == Schema Information
#
# Table name: notes
#
#  id             :uuid             not null, primary key
#  appointment_id :uuid             not null
#  kind           :string
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Note < ApplicationRecord
  belongs_to :appointment

  validates :body, presence: true
end
