FactoryBot.define do
  factory :widget_status do
    name { Faker::Lorem.unique.word }
  end
end
