class Event < ApplicationRecord
  # the creator of the event
  belongs_to :user

end
