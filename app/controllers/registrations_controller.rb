class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :configure_permitted_parameters

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  end
end
