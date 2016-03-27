class Event < ActiveRecord::Base
  has_many :events_artists
  has_many :artists, through: :events_artists

  accepts_nested_attributes_for :artists

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

