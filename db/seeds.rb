# Seed some test data

# Events

Event.destroy_all
10.times do
  Event.create(
    name: Faker::SiliconValley.invention,
    location: Faker::Space.galaxy,
    description:Faker::Lovecraft.paragraph,
    event_link: Faker::Internet.url('example.com'),
    date_time:Faker::Time.forward(14, :evening),
    user_id: User.first.id
  )
end
