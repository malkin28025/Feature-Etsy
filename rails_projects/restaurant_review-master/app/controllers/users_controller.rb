class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to root_url, notice: "You have signed up with great success!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
