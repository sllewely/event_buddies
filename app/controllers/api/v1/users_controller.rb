class API::V1::UsersController < API::V1::APIController

  def show
    json_response(User.find(params[:id]))
  end

  def index
    json_response(User.all)
  end
end
