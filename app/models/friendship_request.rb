class FriendshipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :pending_friend, class_name: 'User'

end
