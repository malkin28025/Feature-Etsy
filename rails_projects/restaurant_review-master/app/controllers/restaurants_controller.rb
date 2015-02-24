class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.includes(:reviews)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params.require(:restaurant).permit(:name, :address, :phone))
    redirect_to root_url
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @users = User.all
  end

end
