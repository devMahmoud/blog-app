class ApplicationController < ActionController::Base
  before_action :authenticate_with_token
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def authenticate_with_token
    if params[:api_token]
      user = User.find_by_api_token(params[:api_token])
      sign_in(user)
    end
  end
end
