# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  date_time   :datetime
#  description :text
#  event_link  :string
#  location    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
end
