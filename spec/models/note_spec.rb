require 'rails_helper'

RSpec.describe Note, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:appointment) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:body) }
  end
end
