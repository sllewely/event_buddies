class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :date_time, :event_link, :created_at

  has_many :user_event_responses
end
