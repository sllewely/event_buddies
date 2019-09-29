class API::V1::FriendshipsController < API::V1::APIController

  # @return [friends] - the friends of the current user
  def index
    json_response(current_user.friends)
  end
end
