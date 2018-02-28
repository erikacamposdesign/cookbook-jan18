Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes, only: [:create, :destroy, :new, :show, :edit, :update]
  resources :cuisines, only: [:create, :new, :show]
  resources :recipe_types, only: [:create, :new, :show]
end
