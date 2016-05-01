class CreateJoinTableArtistsEvents < ActiveRecord::Migration
  def change
    create_table :events_artists do |ea|
      ea.integer :event_id, null: false, index: true
      ea.integer :artist_id, null: false, index: true
      ea.boolean :headliner, default: false
    end
  end
end
