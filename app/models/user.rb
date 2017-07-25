class User < ActiveRecord::Base
  has_many :user_statuses_for_events

  def self.create_with_omniauth(params)
    create!(attrs_from_params(params))
  end

  # User attributes required for creating a new user
  def self.attrs_from_params(params)
    first_name, last_name = name_from_params(params[:info].name)
    {
      temp_token: params[:credentials].token,
      email: params[:info].email,
      first_name: first_name,
      last_name: last_name,
      uuid: generate_uuid,
      provider: :facebook,
      uid: params.uid,
      facebook_image: params[:info].image
    }
  end

  def self.name_from_params(name)
    whole_name = name.split
    [whole_name.first, whole_name.last]
  end

  # TODO: before_create
  def self.generate_uuid
    SecureRandom.uuid
  end

end


# == Schema Information
#
# Table name: users
#
#  id             :integer         not null, primary key
#  access_token   :string
#  temp_token     :string          not null
#  email          :string          not null
#  birthday       :datetime
#  first_name     :string          not null
#  last_name      :string          not null
#  location       :string
#  uuid           :string          not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  provider       :string
#  uid            :string
#  facebook_image :string
#

