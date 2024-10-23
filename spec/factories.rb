FactoryBot.define do
  factory :doctor_profile do
    user
  end

  factory :patient_checkin do
    appointment_date { rand(1..100).days.ago }
    doctor_profile
    patient_profile
  end

  factory :patient_profile do
    user
    age { rand(18..70) }
  end

  factory :user do
    first_name { "Kate" }
    last_name { "Bishop" }
    sequence(:email) { |n| "kate-#{n}@example.com" }

    trait :patient do
      after(:create) { |u| create(:patient_profile, user: u) }
    end

    trait :doctor do
      after(:create) { |u| create(:doctor_profile, user: u) }
    end
  end
end
