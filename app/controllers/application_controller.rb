class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    # カラム追加で1行追記
    added_atters =  [ :username, :icon, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  
end
