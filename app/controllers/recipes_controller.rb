class RecipesController < ApplicationController
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      flash[:notice] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end

  def edit
    id = params[:id]
    @recipe = Recipe.find(id)
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all

    if @recipe.update recipe_params
      redirect_to @recipe
    else
      flash[:notice] = 'Você deve informar todos os dados da receita'
      render 'edit'
    end
  end

  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                :cook_time, :ingredients, :method,:difficulty)
  end
end
