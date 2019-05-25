class FriendshipRequest < ApplicationRecord
  belongs_to :pending_friend, foreign_key: :pending_friend_id, class_name: 'User'
  belongs_to :requesting_friend, foreign_key: :requesting_friend_id, class_name: 'User'

end
