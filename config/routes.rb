Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  resources :recipes
  resources :inventories
  resources :public_recipes
  resources :foods

  root 'users#index'

end
