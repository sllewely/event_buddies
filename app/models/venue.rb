class Venue < ActiveRecord::Base
  has_many :events

end

# == Schema Information
#
# Table name: venues
#
#  id          :integer         not null, primary key
#  name        :string
#  description :text
#  address     :string
#

