Rails.application.routes.draw do

  get 'representatives/index'
  get 'representatives/show'
  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show]

  resources :representatives, only: %i[index show]
end
