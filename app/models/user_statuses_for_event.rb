class UserStatusesForEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  STATUSES = { going: 1, interested: 2, not_interested: 3, cannot_go: 4 }

  def self.update_or_create(user_id, event_id, status)
    if (user_status_for_event = find_by(event_id: event_id, user_id: user_id))
      user_status_for_event.update(status: status)
    else
      create(user_id: user_id, event_id: event_id, status: status)
    end
  end
end

# == Schema Information
#
# Table name: user_statuses_for_events
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  event_id    :integer         not null
#  status      :integer         not null
#  has_tickets :boolean         default("false")
#

