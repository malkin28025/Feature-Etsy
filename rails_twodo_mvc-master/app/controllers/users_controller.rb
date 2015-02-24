class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :email))
    session[:user_id] = @user.id
    redirect_to root_url
  end
end
