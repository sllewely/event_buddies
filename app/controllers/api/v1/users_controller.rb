class API::V1::UsersController < API::V1::APIController

  def show
    if (params[:id] == current_user.id)
      return json_response(User.select(User::PUBLIC_FIELDS + [:email]).find(params[:id]))
    end

    json_response(User.select(*User::PUBLIC_FIELDS).find(params[:id]))
  end
end
