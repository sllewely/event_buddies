class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.datetime :date_time
      t.string :event_link

      t.timestamps
    end
  end
end
