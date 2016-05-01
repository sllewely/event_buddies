class Artist < ActiveRecord::Base
  has_many :events_artists
  has_many :events, through: :events_artists

end

# == Schema Information
#
# Table name: artists
#
#  id          :integer         not null, primary key
#  name        :string
#  spotify_uri :string
#  uuid        :string
#

