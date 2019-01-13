class CreateEventStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :event_statuses, id: :uuid do |t|
      t.belongs_to :event, type: :uuid, index: true, null: false
      t.belongs_to :user, type: :uuid, index: true, null: false
      t.string :status, default: :no_status
      t.timestamps
    end
  end
end
