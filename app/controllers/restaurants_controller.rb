class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end


    def new
        @restaurant = Restaurant.new
    end

    def edit
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to @restaurant, notice: "Restaurant was successful"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
       @restaurant = Restaurant.find(params[:id])
       @restaurant.destroy
       redirect_to restaurants_url, notice: "Restaurant was successfully destroyed."
    end

    private

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :rating)
    end
end
