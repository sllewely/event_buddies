# Seed some test data

# Events

Event.destroy_all
10.times do
  Event.create(
    name: Faker::TvShows::SiliconValley.invention,
    location: Faker::Space.galaxy,
    description:Faker::Books::Lovecraft.paragraph,
    event_link: Faker::Internet.url('example.com'),
    date_time:Faker::Time.forward(14, :evening),
    creator_id: User.first.id
  )
end
