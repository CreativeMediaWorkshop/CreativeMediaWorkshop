class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias_method :current_user, :current_cmw_account

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "禁止访问！"
    redirect_to main_app.root_url
  end
end
