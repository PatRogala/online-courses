FactoryBot.define do
  factory :manufacturer do
    name { Faker::Company.name }
    address
  end
end
