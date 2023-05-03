Rails.application.routes.draw do
  get 'user/index'
  devise_for :users

  resources :recipes
  resources :inventories

  root 'user#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
