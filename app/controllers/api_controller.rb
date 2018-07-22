class ApiController < ActionController::API
  # API only controllers inherit from here instead of application controller
  include Response
  include ExceptionHandler
end