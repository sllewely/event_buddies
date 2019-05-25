class User < ApplicationRecord
  has_many :user_event_responses
  has_many :events, through: :user_event_responses
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  has_many :pending_friendship_requests, foreign_key: :requesting_friend_id, class_name: 'FriendshipRequest'
  has_many :pending_friends, through: :pending_friendship_requests, source: :pending_friend

  has_many :requesting_friendship_requests, foreign_key: :pending_friend_id, class_name: 'FriendshipRequest'
  has_many :requesting_friends, through: :requesting_friendship_requests, source: :requesting_friend


  # has_many :friendship_requests
  # has_many :pending_friends, through: :friendship_requests, class_name: '

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
end
