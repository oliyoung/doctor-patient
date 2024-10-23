if Rails.env.development?
  require "factory_bot"

  namespace :dev do
    desc "Reset database and load sample data"
    task prime: ["db:reset", "dev:seed"]

    desc "Load sample data"
    task seed: :environment do
      include FactoryBot::Syntax::Methods
      include ActionView::Helpers::TextHelper

      users.each do |user_attrs|
        User.where(user_attrs).first_or_create
      end

      clint = User.where(email: "clint@example.com").first
      patient_clint = PatientProfile.where(user: clint, age: 40).first_or_create

      bruce = User.where(email: "banner@example.com").first
      doctor_bruce = DoctorProfile.where(user: bruce).first_or_create

      12.times do
        PatientCheckin.create(
          doctor_profile: doctor_bruce,
          patient_profile: patient_clint,
          appointment_date: rand(1..100).days.ago,
        )
      end
    end
  end

  def users
    @users ||= [
      {
        first_name: "Clint",
        last_name: "Barton",
        email: "clint@example.com"
      },
      {
        first_name: "Laura",
        last_name: "Barton",
        email: "laura@example.com"
      },
      {
        first_name: "Natasha",
        last_name: "Romanoff",
        email: "nat@example.com"
      },
      {
        first_name: "Bruce",
        last_name: "Banner",
        email: "banner@example.com"
      },
      {
        first_name: "Steve",
        last_name: "Rogers",
        email: "steve@example.com"
      }
    ]
  end
end
