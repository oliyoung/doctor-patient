require "rails_helper"

RSpec.feature "user opens dashboard" do
  scenario "and sees a list of their appointments" do
    user = FactoryBot.create(:user, :patient)
    visit root_path
    click_on t("application.user_nav.login")
    within "form" do
      fill_in :session_email, with: user.email
      click_on "Log in"
    end
    expect(page).to have_selector('#appointments')
    expect(page).to have_selector('#new_appointment')
  end
end
