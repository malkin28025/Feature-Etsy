class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params_including_user_id)
    respond_to do |format|
      format.html do
        flash[:notice] = "Woohoo new review!"
        redirect_to @restaurant
      end
      format.js {} #look for create.js.erb in app/views/reviews
    end
  end

  private

  def params_including_user_id
    review_params.merge(user_id: session[:user_id])
  end
  
  def review_params
    params.require(:review).permit(:comment, :rating, :recommend)
  end
end
