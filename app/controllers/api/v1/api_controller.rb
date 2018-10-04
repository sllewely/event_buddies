class API::V1::APIController < ActionController::API
  # API only controllers inherit from here instead of application controller
  include Response
  include ExceptionHandler

  before_action :authenticate_user!
end
