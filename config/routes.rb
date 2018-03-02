Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes, only: [:create, :destroy, :edit, :new, :show, :update]
  resources :cuisines, only: [:create, :edit, :new, :show, :update]
  resources :recipe_types, only: [:create, :new, :show]
end
