FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    zip { Faker::Address.zip }
  end
end
