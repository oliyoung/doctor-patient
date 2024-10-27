require "rails_helper"

RSpec.feature "user opens dashboard" do
  scenario "and books an appointment, and cancels" do
    user = FactoryBot.create(:user, :patient)
    doctor = FactoryBot.create(:user, :doctor)
    visit root_path
    expect(page).not_to have_text(user.first_name)
    expect(page).not_to have_text t("application.user_nav.logout")

    click_on t("application.user_nav.login")
    within "form" do
      fill_in :session_email, with: user.email
      click_on t("sessions.new.login")
    end
    expect(page).to have_selector('#appointments')
    expect(page).to have_selector('#new_appointment')

    click_on t("appointments.new")
    expect(page).to have_selector('form.new_appointment')

    within "form.new_appointment" do
      fill_in 'appointment_appointment_at', with: DateTime.current.strftime("%Y-%m-%dT%I:%M")
      select "Dr #{doctor.last_name}", from: "appointment_doctor_profile_id"
      select "Checkup", from: "appointment_purpose"
      select "Wakanda", from: "appointment_clinic"
      click_on "Book"
    end

    expect(page).not_to have_selector('form.new_appointment')
    expect(page).to have_text("Dr #{doctor.last_name}")
    expect(page).to have_text("Wakanda")
    expect(page).to have_text("Checkup")
    expect(page).to have_text(t("appointments.edit"))
    expect(page).to have_text(t("appointments.destroy"))

    click_on t("appointments.destroy")
    expect(page).not_to have_text("Dr #{doctor.last_name}")
    expect(page).not_to have_text("Wakanda")
    expect(page).not_to have_text("Checkup")
  end

  scenario "and books an appointment, and edits" do
    user = FactoryBot.create(:user, :patient)
    doctor = FactoryBot.create(:user, :doctor)
    visit root_path
    expect(page).not_to have_text(user.first_name)
    expect(page).not_to have_text t("application.user_nav.logout")

    click_on t("application.user_nav.login")
    within "form" do
      fill_in :session_email, with: user.email
      click_on t("sessions.new.login")
    end
    expect(page).to have_selector('#appointments')
    expect(page).to have_selector('#new_appointment')

    click_on t("appointments.new")
    expect(page).to have_selector('form.new_appointment')

    within "form.new_appointment" do
      fill_in 'appointment_appointment_at', with: DateTime.current.strftime("%Y-%m-%dT%I:%M")
      select "Dr #{doctor.last_name}", from: "appointment_doctor_profile_id"
      select "Checkup", from: "appointment_purpose"
      select "Wakanda", from: "appointment_clinic"
      click_on "Book"
    end

    expect(page).not_to have_selector('form.new_appointment')
    expect(page).to have_text("Dr #{doctor.last_name}")
    expect(page).to have_text("Wakanda")
    expect(page).to have_text("Checkup")
    expect(page).to have_text(t("appointments.edit"))
    expect(page).to have_text(t("appointments.destroy"))

    click_on t("appointments.edit")
    expect(page).to have_selector('form.edit_appointment')
    within "form.edit_appointment" do
      select "Latveria", from: "appointment_clinic"
      click_on "Book"
    end
    expect(page).to have_text("Latveria")
  end
end
