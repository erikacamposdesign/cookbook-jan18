Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes, except: [:index] do
    collection do
      get 'search'
    end
  end
  resources :cuisines, only: [:create, :edit, :new, :show, :update]
  resources :recipe_types, only: [:create, :new, :show]
end
