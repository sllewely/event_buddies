class Event < ActiveRecord::Base

end

# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  name        :string          not null
#  date        :date            not null
#  start_time  :time
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#

