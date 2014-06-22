class RestaurantsController < ApplicationController

  # GET / - list 10 most recent
  def root
    @restaurants = Restaurant.last(10).reverse
  end

  # GET /restaurants - list of all restaurants
  def index
    @restaurants = Restaurant.all.order(name: :asc)
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city,
      :state, :zip, :description, :category_id)
  end

end
