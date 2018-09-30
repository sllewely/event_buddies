class EventStatus < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { interested: 0, going: 1, cant_go: 2, not_interested: 3 }
end
