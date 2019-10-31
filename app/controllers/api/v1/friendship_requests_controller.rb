class API::V1::FriendshipRequestsController < API::V1::APIController

  # @return [requesting_friendship_requests] - the incoming friend requests for the current user
  def index
    json_response(current_user.requesting_friendship_requests.includes(:requesting_friend))
  end

  # @param [pending_friend_id] - the friend to create a friend request for
  def create
    res = current_user.pending_friendship_requests.create!(pending_friend: pending_friend)
    json_response(res)
  end

  # @param [requesting_friend_id] - the user id of the friend request to accept
  def confirm
    json_response(incoming_friendship_request.accept!)
  end

  # @param [requesting_friend_id] - the user id of the friend request to delete
  def reject
    json_response(incoming_friendship_request.destroy)
  end

  private

  def incoming_friendship_request
    FriendshipRequest.find_by!(id: params[:id], pending_friend: current_user)
  end

  def pending_friend
    User.find(params[:pending_friend_id])
  end
end
