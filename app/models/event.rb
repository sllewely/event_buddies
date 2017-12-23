class Event < ActiveRecord::Base
  has_many :events_artists, dependent: :destroy
  has_many :artists, through: :events_artists
  belongs_to :created_by, foreign_key: :created_by_id, class_name: 'User'
  belongs_to :venue
  has_many :user_statuses_for_events

  accepts_nested_attributes_for :artists

  def display_name
    name.empty? ? headlining_artist.name : name
  end

  def self.all_recent_events
    self.all.includes(:venue, :user_statuses_for_events).where(['date >= ?', Date.today]).order(:date)
  end

  def headlining_artist
    artists.where(events_artists: { headliner: true } ).first
  end

  def to_hash
    as_json.merge!(user_statuses_for_events: user_statuses_for_events, venue: venue)
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
#  venue_id    :integer
#

