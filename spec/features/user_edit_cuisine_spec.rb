require 'rails_helper'

feature 'User edit cuisine' do
  scenario 'success' do
    cuisine = Cuisine.create(name: 'Indiana')

    visit root_path
    click_on cuisine.name
    click_on 'Editar Cozinha'
    fill_in 'Nome', with: 'Tailandesa'
    click_on 'Enviar'

    expect(current_path).to eq cuisine_path(cuisine)
    expect(page).to have_css('h1', 'Tailandesa')
  end

  scenario 'and cuisine can be blank' do
    cuisine = Cuisine.create(name: 'Indiana')

    visit cuisine_path(cuisine)
    click_on 'Editar Cozinha'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome da Cozinha')
  end
end
