class RecipeTypesController < ApplicationController

  def create
    @recipe_type = RecipeType.new(create_params)

    if @recipe_type.save
      redirect_to recipe_type_path(@recipe_type)
    else
      flash[:notice] = 'Você deve informar o nome do tipo de receita'
      render :new
    end
  end

  def new
    @recipe_type = RecipeType.new
  end

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

  def create_params
    params.require(:recipe_type).permit(:name)
  end

end
