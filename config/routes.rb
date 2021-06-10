Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rentals, only: %i[new create show edit update destroy]
  resources :renters, only: %i[new create show edit update destroy]
  get '/dashboard', to: 'pages#dashboard'
end
