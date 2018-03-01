class CuisinesController < ApplicationController

  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to cuisine_path(@cuisine.id)
    else
      render :new
    end
  end

  def edit
    @cuisine = Cuisine.find params[:id]
  end

  def new
    @cuisine = Cuisine.new
  end

  def show
    @cuisine = Cuisine.find params[:id]
  end

  def update
    @cuisine = Cuisine.find params[:id]

    if @cuisine.update(cuisine_params)
      redirect_to cuisine_path(@cuisine)
    else
      flash[:notice] = 'Você deve informar o nome da Cozinha'
      render :edit
    end
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
