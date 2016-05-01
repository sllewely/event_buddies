class EventsArtist < ActiveRecord::Base
  belongs_to :events
  belongs_to :artist

end

# == Schema Information
#
# Table name: events_artists
#
#  id        :integer         not null, primary key
#  event_id  :integer         not null
#  artist_id :integer         not null
#  headliner :boolean         default("false")
#

