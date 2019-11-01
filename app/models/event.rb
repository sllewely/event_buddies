class Event < ApplicationRecord
  has_many :user_event_responses
  has_many :users, through: :user_event_responses

  scope :today_onwards, -> { where("date_time >= ?", Date.today.beginning_of_day) }
  scope :hosted_by, -> (user_id) { joins(:user_event_responses).where(user_event_responses: { user_id: user_id, host: true }) }

  validates :name, presence: true
  validates :date_time, presence: true

  # Get the hosts for the event
  def hosts
    users.merge(UserEventResponse.hosting)
  end

end
