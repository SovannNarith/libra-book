class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :require_admin?

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be log in first!"
      redirect_to log_in_path
    end
  end

  def require_admin?
    if logged_in? && !current_user.admin?
      flash[:danger] = "Only Admin can perform this action"
      render '/'
    end
  end

end
