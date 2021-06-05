FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    sequence(:email) { |n| "person#{n}@example.com" }
    introduction { Faker::Lorem.characters(number: 10) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
