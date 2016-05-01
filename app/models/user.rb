class User < ActiveRecord::Base
end

# == Schema Information
#
# Table name: users
#
#  id           :integer         not null, primary key
#  access_token :string
#  temp_token   :string          not null
#  email        :string          not null
#  birthday     :datetime
#  first_name   :string          not null
#  last_name    :string          not null
#  facebook_uid :string          not null
#  location     :string
#  uuid         :string          not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

