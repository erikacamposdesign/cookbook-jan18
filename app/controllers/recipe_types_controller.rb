class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])

    if @recipe_type.recipes.empty?
      flash[:notice] = msg
    end
  end

  private

  def msg
    'Nenhuma receita encontrada para este tipo de receitas'
  end
end
