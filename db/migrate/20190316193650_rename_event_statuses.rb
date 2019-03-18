class RenameEventStatuses < ActiveRecord::Migration[5.2]
  def change
    rename_table :event_statuses, :user_event_responses

    add_index :user_event_responses, [:user_id, :event_id], unique: true
  end
end
