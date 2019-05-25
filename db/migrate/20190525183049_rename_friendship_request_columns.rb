class RenameFriendshipRequestColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendship_requests, :user_id, :requesting_friend_id
  end
end
