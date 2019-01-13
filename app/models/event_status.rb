class EventStatus < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:interested, :going, :cant_go, :not_interested, :none]
end
