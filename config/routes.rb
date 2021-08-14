Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :renters
  resources :buildings do
    resources :rentals
  end
  get '/dashboard', to: 'pages#dashboard'
  get '/add', to: 'pages#add'
end
