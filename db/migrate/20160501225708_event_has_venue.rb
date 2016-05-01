class EventHasVenue < ActiveRecord::Migration
  def change
    add_column :events, :venue_id, :integer
    add_index :events, :venue_id
  end
end
