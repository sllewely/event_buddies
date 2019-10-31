class Event < ApplicationRecord
  has_many :user_event_responses
  has_many :users, through: :user_event_responses

  scope :today_onwards, -> { where("date_time >= ?", Date.today.beginning_of_day) }

  validates :name, presence: true
  validates :date_time, presence: true

  # Get the hosts for the event
  def hosts
    users.merge(UserEventResponse.hosting)
  end

end
