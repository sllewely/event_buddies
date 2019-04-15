class Event < ApplicationRecord
  has_many :user_event_responses
  has_many :users, through: :user_event_responses

  # Get the hosts for the event
  def hosts
    users.where(user_event_responses: { host: true })
  end

end
