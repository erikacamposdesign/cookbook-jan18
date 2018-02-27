require 'rails_helper'

feature 'User dont create duplicated cuisines' do
  scenario 'alert message' do
    cuisine = Cuisine.create(name: 'Japonesa')

    visit root_path
    click_on 'Nova Cozinha'
    fill_in 'Nome', with: 'Japonesa'

    click_on 'Enviar'

    expect(page).to have_content('Essa cozinha já existe!')
  end
end
