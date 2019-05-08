1000.times do
  Stylist.create(name: Faker::Name.name, location: Faker::Address.city)
end

500.times do
  Client.create(name: Faker::Name.female_first_name + " " + Faker::Name.last_name, gender: "F")
end

500.times do
  Client.create(name: Faker::Name.male_first_name + " " + Faker::Name.last_name, gender: "M")
end

1000.times do
  Appointment.create(client_id: Client.all.sample.id, stylist_id: Stylist.all.sample.id)
end
