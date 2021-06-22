Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rentals, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :renters, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get '/dashboard', to: 'pages#dashboard'
  get '/add', to: 'pages#add'
end
