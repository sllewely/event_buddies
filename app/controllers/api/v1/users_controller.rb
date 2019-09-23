class API::V1::UsersController < API::V1::APIController

  def show
    selected_fields = User::PUBLIC_FIELDS
    selected_fields += [:email] if params[:id] == current_user.id

    json_response(User.select(selected_fields).find(params[:id]))
  end
end
