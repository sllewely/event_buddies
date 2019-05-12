FactoryBot.define do
  factory :friendship_request do
    user { user }
    pending_user_request { user2 }
  end
end