class CreateUserStatusesForEvents < ActiveRecord::Migration
  def change
    create_table :user_statuses_for_events do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.integer :status, null: false
      t.boolean :has_tickets, default: false
    end

    add_index :user_statuses_for_events, [:user_id, :event_id], unique: true
  end
end
