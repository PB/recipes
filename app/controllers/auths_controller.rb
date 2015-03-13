class AuthsController < ApplicationController
  before_action :check_user_logged, only: [:new, :create]
  
  def new
  end

  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      redirect_to chef, notice: 'You are logged in'
    else
      redirect_to login_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    require_user
    session[:chef_id] = nil
    redirect_to root_path #, notice: 'You are logged out'
  end
  
  private
    def check_user_logged
      if logged_in?
        redirect_to root_path
      end
    end
end
