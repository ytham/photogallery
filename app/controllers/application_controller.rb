class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin_user
  helper_method :current_user
  helper_method :admin_user_or_current_user

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_user_or_current_user
      redirect_to(root_path) unless current_user.admin? || current_user
  end

  def signed_in_user
    redirect_to login_path, notice: "Please sign in" unless signed_in?
  end

  def signed_in?
    !current_user.nil?
  end

end
