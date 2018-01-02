class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:show,:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  rescue_from CanCan::AccessDenied do
  	 redirect_to root_path, notice:"The page u are looking for doesnt exist" 
  end
  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:mobile_number,:first_name,:last_name,:role_id,:email])
  end
  
end
