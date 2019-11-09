class FriendshipRequestSerializer < ActiveModel::Serializer
  has_one :requesting_friend
  attributes :id, :created_at

end
