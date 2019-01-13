class AddUserToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :creator_id, :uuid, null: false

    add_index :events, :creator_id
  end
end
