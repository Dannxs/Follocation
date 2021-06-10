Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rentals, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :renters, only: [:new, :create, :show, :edit, :update, :destroy]
  get '/dashboard', to: 'pages#dashboard'
end
