class API::V1::FriendshipRequestsController < API::V1::APIController

  def index
    json_response(current_user.requesting_friendship_requests.includes(:requesting_friend))
  end

  # @param pending_friend_id the friend to create a friend request for
  def create
    current_user.pending_friendship_requests.create!(pending_friend: pending_friend)
  end

  def confirm
    json_response('not implemented')
  end

  # @param requesting_friend_id the friend request to delete
  def reject
    current_user.requesting_friendship_requests.find(requesting_friend_id: params['requesting_friend_id']).destroy
  end

  private

  def pending_friend
    User.find(params[:pending_friend_id])
  end
end
