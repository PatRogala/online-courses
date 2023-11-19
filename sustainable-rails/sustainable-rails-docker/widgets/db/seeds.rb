if !Rails.env.development?
  puts "[ db/seeds.rb ] Seed data is for development only, " +
          "not #{Rails.env}"
  exit 0
end

require "factory_bot"

Widget.destroy_all
Manufacturer.destroy_all
Address.destroy_all
WidgetStatus.destroy_all

puts "[ db/seeds.rb ] Creating development data..."
FactoryBot.create(:widget_status, name: "Fresh")
10.times do
  FactoryBot.create(:manufacturer)
end
cyberdyne = FactoryBot.create(:manufacturer,
                              name: "Cyberdyne Systems")
FactoryBot.create(:widget, name: "Stembolt",
                            manufacturer: cyberdyne)
puts "[ db/seeds.rb ] Done"
