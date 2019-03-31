class Event < ApplicationRecord
  has_many :user_event_responses
  has_many :users, through: :event_statuses

end
