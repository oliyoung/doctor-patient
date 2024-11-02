# == Schema Information
#
# Table name: conversations
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context "associations" do
    it { is_expected.to has_many(:conversation) }
    it { is_expected.to has_and_belongs_to_many(:user) }
  end
end
