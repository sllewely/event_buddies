class AddTimeStampToFriendshipTables < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :friendship_requests, null: false
    add_timestamps :friendships, null: false
  end
end
