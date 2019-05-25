class API::V1::FriendshipRequestsController < API::V1::APIController

  def index
    json_response(current_user.requesting_friendship_requests.include(:requesting_friends))
  end

  def create
    current_user.pending_friendship_requests.create!(pending_friend: pending_friend)
  end

  def confirm
    json_response('not implemented')
  end

  def reject
    json_response('not implemented')
  end

  private

  def pending_friend
    User.find(params[:pending_friend_id])
  end
end
