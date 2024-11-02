# == Schema Information
#
# Table name: messages
#
#  id              :uuid             not null, primary key
#  conversation_id :uuid             not null
#  user_id         :uuid             not null
#  body            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
end
