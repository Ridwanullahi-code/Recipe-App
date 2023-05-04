Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  resources :recipes
  resources :inventories
  resources :public_recipes
  resources :foods

  root 'user#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
    resources :recipes
    resources :inventories
end
