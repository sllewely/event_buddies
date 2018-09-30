class CreateEventStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :event_statuses do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
