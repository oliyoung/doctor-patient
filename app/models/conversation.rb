# == Schema Information
#
# Table name: conversations
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Conversation < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :users
  has_many :messages


  def to_s
     name
  end
end
