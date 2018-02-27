class CuisinesController < ApplicationController

  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to cuisine_path(@cuisine.id)
    else
      render :new
    end
  end

  def new
    @cuisine = Cuisine.new
  end

  def show
    @cuisine = Cuisine.find params[:id]
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
