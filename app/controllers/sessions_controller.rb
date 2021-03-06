class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_user_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
      flash.now[:danger] = "Invalid login info. Please try again."
      render 'new'
    end
  end

  def destroy
    log_user_out if logged_in?
    redirect_to root_url
  end
end
