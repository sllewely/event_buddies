class FriendshipRequest < ApplicationRecord
  belongs_to :pending_friend, foreign_key: :pending_friend_id, class_name: 'User'
  belongs_to :requesting_friend, foreign_key: :requesting_friend_id, class_name: 'User'

  def accept!
    FriendshipRequest.transaction do
      User.find(pending_friend_id) && User.find(requesting_friend_id)
      Friendship.create!(user_id: requesting_friend_id, friend_id: pending_friend_id)
      Friendship.create!(user_id: pending_friend_id, friend_id: requesting_friend_id)
      self.destroy!
    end
  end

end
