class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  alias_method :current_user, :current_cmw_account

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "禁止访问！"
    redirect_to main_app.root_url
  end

  after_filter :store_location

  # Devise redirect to last page
  def store_location
    # store last url as long as it isn't a /cmw_accounts path
    # session[:previous_url] = request.original_url unless request.original_url =~ /\/cmw_accounts/
      # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/cmw_accounts/sign_in" &&
        request.fullpath != "/cmw_accounts/sign_up" &&
        request.fullpath != "/cmw_accounts/password" &&
        request.fullpath != "/cmw_accounts/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.original_url 
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_url
  end

  # Allow additional params in Devise
  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit( :email, :password, :password_confirmation, :name)
    end
  end
end
