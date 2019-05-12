class FriendshipRequest < ApplicationRecord
  belongs_to :incoming_friend
  belongs_to :pending_friend, class_name: 'User'

end
