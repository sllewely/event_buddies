class Event < ActiveRecord::Base
  has_many :events_artists, dependent: :destroy
  has_many :artists, through: :events_artists
  belongs_to :venue

  accepts_nested_attributes_for :artists

  def display_name
    name.empty? ? headlining_artist.name : name
  end

  def headlining_artist
    artists.where(events_artists: { headliner: true } ).first
  end

end

# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  name        :string          not null
#  date        :date            not null
#  start_time  :time
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#

