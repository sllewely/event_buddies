class UserEventResponseSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :user_id, :status, :host

  belongs_to :post
  belongs_to :user
end