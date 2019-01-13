FactoryBot.define do
  factory :user do
    first_name 'Dave'
    last_name 'Grohl'
    email 'dave@foofighters.com'
    password 'coolestdad'
  end

  factory :event do
    name 'Yeah Yeah Yeah'
    creator :user
    date_time '2018-7-23-21.5'
  end
end
