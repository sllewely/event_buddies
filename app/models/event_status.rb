class EventStatus < ApplicationRecord
  belongs_to :user
  belongs_to :event

  STATUSES =  [:interested, :going, :cant_go, :not_interested, :no_status]

  #TODO: validate status
  # TODO: validate user has access to associated event
end
