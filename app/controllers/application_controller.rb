class ApplicationController < ActionController::Base
  include ApplicationHelper


  before_action :configure_devise_parameters, if: :devise_controller?
  #AUTORISER LA MODIFICATION DU FORMULAIRE DE LA GEM DEVISE
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)}
  end

end
