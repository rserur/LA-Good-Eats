class RestaurantsController < ApplicationController

  # GET /restaurants - list of restaurants
  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  # GET /restaurants/new - form display to create restaurant
  def new
    @restaurant = Restaurant.new
  end

  # POST /questions
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant added.'
    else
      render action: 'new'
    end
  end

  # GET /restaurants/:id - single restaurant details and all reviews
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # GET /restaurants/:id/reviews/new - form display to review restaurant

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city,
      :state, :zip, :description, :category_id)
  end

end
