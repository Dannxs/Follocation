Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :renters
  
  resources :buildings do
    resources :rentals, only: [:new, :create, :edit, :update, :show]
  end
  resources :rentals, only: [:destroy]
  get '/dashboard', to: 'pages#dashboard'
  get '/add', to: 'pages#add'
end
