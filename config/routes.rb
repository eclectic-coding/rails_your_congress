Rails.application.routes.draw do

  get 'senators/index'
  get 'senators/show'
  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show]

  resources :representatives, only: %i[index show]

end
