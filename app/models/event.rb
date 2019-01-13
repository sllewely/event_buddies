class Event < ApplicationRecord
  # the creator of the event
  belongs_to :creator, class_name: 'User'
  has_many :event_statuses
  has_many :users, through: :event_statuses
end
