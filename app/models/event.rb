class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_event_responses
  has_many :users, through: :event_statuses
end
