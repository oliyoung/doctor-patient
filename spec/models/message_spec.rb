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
require 'rails_helper'

RSpec.describe Message, type: :model do
  context "associations" do
    it { is_expected.to belongs_to(:conversation) }
    it { is_expected.to belongs_to(:user) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:body) }
  end
end
