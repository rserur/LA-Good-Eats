class ReviewsController < ApplicationController

  # GET /restaurants/:id/reviews/new - display review form
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)

    @review.restaurant = @restaurant

    if @review.save
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      render action: 'new'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
