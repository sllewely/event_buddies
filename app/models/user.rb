class User < ApplicationRecord
  has_many :event_statuses
  has_many :events, through: :event_statuses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
end
