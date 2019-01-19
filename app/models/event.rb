class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_statuses
  has_many :users, through: :event_statuses
end
