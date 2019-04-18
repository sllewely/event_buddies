class UserEventResponse < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :hosting, -> { where(host: true) }

  STATUSES =  [:interested, :going, :cant_go, :not_interested, :no_status]

  validate :valid_status

  def valid_status
    if !STATUSES.include?(status.to_sym)
      errors.add(:status, "status #{status} not valid")
    end
  end

  # TODO: validate user has access to associated event
end
