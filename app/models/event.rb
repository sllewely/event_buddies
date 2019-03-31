class Event < ApplicationRecord
  has_many :user_event_responses
  has_many :users, through: :user_event_responses

  def hosts
    users.joins(:user_event_responses).where(user_event_responses: { host: true })
  end

end
