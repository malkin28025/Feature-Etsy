class SessionsController < ApplicationController

  def create
    # I want to take input from a user,
    user = User.where(email: params[:email]).first
    # connect it to info in the db about the user,
    if user 
      session[:user_id] = user.id
      # use that to set a value in the session.
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to root_url
    else
      flash[:alert] = "You type like a dumbass"
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have successfully logged out. Thank you. Come again!"
  end
end
