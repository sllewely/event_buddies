class UserStatusesForEvent < ActiveRecord::Base
  STATUSES = { going: 1, interested: 2, not_interested: 3, cannot_go: 4 }
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

