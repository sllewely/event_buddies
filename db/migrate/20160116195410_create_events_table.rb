class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.time :start_time

      t.timestamps null: false
    end
  end
end
