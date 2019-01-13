FactoryBot.define do
  factory :user do
    first_name 'Dave'
    last_name 'Grohl'
    email 'dave@foofighters.com'
    password 'coolestdad'
  end

  factory :user2 do
    first_name 'karen'
    last_name 'o'
    email 'ko@ko.com'
    password 'date_with_the_night'
  end

  factory :event do
    name 'Yeah Yeah Yeah'
    # association :creator, factory: :user
    date_time '2018-7-23-21.5'
  end
end
