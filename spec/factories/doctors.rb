FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    hospital { Faker::Address.city }
    specialization { 'Medicine and Sugery' }
    cost_per_consult { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.paragraph }
  end
end
