class User < ApplicationRecord
  has_many :user_event_responses
  has_many :events, through: :user_event_responses
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  has_many :incoming_friend_requests, 


  has_many :friendship_requests
  has_many :pending_friends, through: :friendship_requests, class_name: 'User'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
end
