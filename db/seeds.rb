# Seed some test data

# Events

Event.destroy_all
100.times do
  event = Event.create(
    name: Faker::TvShows::SiliconValley.invention,
    location: Faker::Space.galaxy,
    description:Faker::Books::Lovecraft.paragraph,
    event_link: Faker::Internet.url('example.com'),
    date_time:Faker::Time.forward(14, :evening),
  )
  UserEventResponse.create(
    user:User.first,
    event: event
  )
end
