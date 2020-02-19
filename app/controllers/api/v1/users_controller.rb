class API::V1::UsersController < API::V1::APIController

  def show
    json_response(User.find(params[:id]))
  end

  def upload_profile_picture
    profile_picture.attach(params[:profile_picture])
  end

  def index
    json_response(User.all)
  end
end
