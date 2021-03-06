class SessionController < ApplicationController

  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
