class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

     def configure_permitted_parameters
       #以下の:name部分は追加したカラム名に変える
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name,:avatar])
     end
     
     def after_sign_in_path_for(resource)
       wines_path
     end
end
