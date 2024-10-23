require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  helper_method :current_user

  private

  def current_user
    if user_id
      @current_user ||= User.find(user_id)
    end
  end

  def user_id
    session[:user_id]
  end

  def deny_access(path: login_path, alert: t("flash.unauthorised"))
    redirect_to path, alert: alert
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      deny_access
    end
  end
end
