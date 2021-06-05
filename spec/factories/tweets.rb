FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.characters(number: 140) }
  end
end
