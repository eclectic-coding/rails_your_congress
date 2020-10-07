Rails.application.routes.draw do

  root to: 'static#home'

  devise_for :users

  resources :users, only: [:show]

  resources :representatives, only: %i[index show]
  resources :senators, only: %i[index show]

end
