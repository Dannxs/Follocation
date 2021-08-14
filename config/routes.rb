Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rentals
  resources :renters
  resources :renters
  get '/dashboard', to: 'pages#dashboard'
  get '/add', to: 'pages#add'
end
