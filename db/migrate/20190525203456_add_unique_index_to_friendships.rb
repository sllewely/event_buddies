class AddUniqueIndexToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_index :friendships, [:user_id, :friend_id], unique: true, name: :index_unique_friendships
    add_index :friendship_requests, [:pending_friend_id, :requesting_friend_id], unique: true, name: :index_unique_friendship_requests
  end
end
