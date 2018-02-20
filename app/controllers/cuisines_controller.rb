class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find params[:id]
  end
end
