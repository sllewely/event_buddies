class AddUserToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_id, :integer, null: false

    add_index :events, :user_id
  end
end
