require 'rails_helper'

feature 'User delete a recipe' do
  scenario 'success' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Quindim', recipe_type: recipe_type, cuisine: cuisine,
              difficulty: 'fácil', cook_time: 90, ingredients: 'ovo e açúcar', method: 'Juntar tudo e levar ao forno')

    visit root_path
    click_on recipe.title
    click_on 'Excluir receita'

    expect(current_path).to eq(root_path)

    visit recipe_path(recipe)
    expect(page).to have_content('Esta receita não existe')
  end
end
