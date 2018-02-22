class RecipeTypesController < ApplicationController

  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.all
  end

end
