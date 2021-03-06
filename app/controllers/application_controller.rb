class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def check_access
    if current_user != @chef
      redirect_to root_path, alert: "You don't have permission"
    end
  end
  
  def require_user
    redirect_to :back, alert: "You must be logged in" if !logged_in?
  end
  
end
