require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    new_cuisine = Cuisine.create(name: 'Italiana')
    new_recipe_type = RecipeType.create(name: 'Prato principal')

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: 'Penne ao pesto'
    select new_recipe_type.name, from: 'Tipo da Receita'
    select new_cuisine.name, from: 'Cozinha'
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Tempo de Preparo', with: 50
    fill_in 'Ingredientes', with: 'Penne e manjericão'
    fill_in 'Como Preparar', with: 'Cozinhe o penne e misture o manjericão'
    click_on 'Enviar'

    expect(current_path).to eq(recipe_path(recipe))
    expect(page).to have_css('h1', text: 'Penne ao pesto')
    expect(page).to have_css('p', text: new_recipe_type.name)
    expect(page).to have_css('p', text: new_cuisine.name)
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('p', text: 50)
    expect(page).to have_css('p', text: 'Penne e manjericão')
    expect(page).to have_css('p', text: 'Cozinhe o penne e misture o manjericão')
  end
end
