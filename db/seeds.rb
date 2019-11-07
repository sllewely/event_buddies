# Seed some test data

# Events

Event.destroy_all
500.times do
  event = Event.create(
    name: Faker::TvShows::SiliconValley.invention,
    location: Faker::Space.galaxy,
    description:Faker::Books::Lovecraft.paragraph,
    event_link: Faker::Internet.url(host: 'example.com'),
    date_time:Faker::Time.forward(days: 80, period: :evening),
  )
  UserEventResponse.create(
    user:User.first,
    event: event
  )
end

# Friendships

User.destroy_all
user = User.create(first_name: "Test", last_name: "Tester", email: "tester@gmail.com", password: "password")
users = []
5.times do
  users << User.create(
      first_name: Faker::Name::first_name,
      last_name: Faker::Name::last_name,
      email: Faker::Internet::email,
      password: "password"
  )
end
# Create friendships
user.pending_friendship_requests.create!(pending_friend: users[0])
user.pending_friendship_requests.create!(pending_friend: users[1])
user.pending_friendship_requests.create!(pending_friend: users[2])
users[0].pending_friendship_requests.create!(pending_friend: users[1])
users[0].pending_friendship_requests.create!(pending_friend: users[2])
users[1].pending_friendship_requests.create!(pending_friend: users[3])
users[3].pending_friendship_requests.create!(pending_friend: users[4])
FriendshipRequest.all.each { |fr| fr.accept! }
# and limbo requests
user.pending_friendship_requests.create!(pending_friend: users[3])
users[4].pending_friendship_requests.create!(pending_friend: user)
