FactoryBot.define do
  factory :user do
    first_name { 'Dave' }
    last_name { 'Grohl' }
    email { 'dave@foofighters.com' }
    password { 'coolestdad' }
  end

  factory :user2 do
    first_name { 'karen' }
    last_name { 'o' }
    email { 'ko@ko.com' }
    password { 'date_with_the_night' }
  end

  factory :event do
    name { 'Yeah Yeah Yeah' }
    date_time { '2018-7-23-21.5' }
  end

  factory :event2 do
    name { 'Board Games at My Place' }
    date_time { '2018-8-16-14' }
  end

  factory :event3 do
    name { 'System of a Down' }
    date_time { '2018-9-12-20' }
  end

  factory :event4 do
    name { 'Elizabeth Colour Wheel' }
    date_time { '2018-10-25-11.5' }
  end
end
