class CreateEventStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :event_statuses, id: :uuid do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.string :status, default: :none
      t.timestamps
    end
  end
end
