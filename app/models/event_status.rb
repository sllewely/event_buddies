class EventStatus < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:interested, :going, :cant_go, :not_interested, :no_status]

  # scope :for_user, -> (user) { joins(:events).for_user(user) }

  #TODO: validate status
  # TODO: validate user has access to associated event
end
