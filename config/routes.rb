Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  # resources :recipes
  # resources :inventories
  # resources :public_recipes
  # resources :foods
  resources :foods, except: [:update]

  resources :inventories, only: [:index, :show, :destroy, :new, :create] do
    get 'foods/new', to: 'inventory_foods#new'
    post 'foods', to: 'inventory_foods#create'
    delete 'foods/:id', to: 'inventory_foods#destroy', as: 'food'
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :put ] do
    resources :recipe_foods, path: 'food', only: [:destroy, :new, :create]
  end

  root 'users#index'

end
