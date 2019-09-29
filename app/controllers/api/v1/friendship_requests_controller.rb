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

  def confirm
    json_response('not implemented')
  end

  # @param []requesting_friend_id] - the friend request to delete
  def reject
    res = current_user.requesting_friendship_requests.find_by(requesting_friend_id: params['id']).destroy
    json_response(res)
  end

  private

  def pending_friend
    User.find(params[:pending_friend_id])
  end
end
