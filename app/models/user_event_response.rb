class UserEventResponse < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :hosting, -> { where(host: true) }

  STATUSES =  [:interested, :going, :cant_go, :not_interested, :no_status]

  validates :status, inclusion: { in: STATUSES.map(&:to_s) }

  # TODO: validate user has access to associated event
end
