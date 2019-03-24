class CreateFriendshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendship_requests, id: :uuid do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :pending_friend_id, null: false, index: true
    end
  end
end
