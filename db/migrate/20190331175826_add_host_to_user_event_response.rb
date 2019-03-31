class AddHostToUserEventResponse < ActiveRecord::Migration[5.2]
  def change
    add_column :user_event_responses, :host, :boolean, null: false, default: false

    add_index :user_event_responses, [:user_id, :host]
  end
end
