class CreateFriendship < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships, id: :uuid do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :friend_id, null: false, index: true
    end
  end
end
