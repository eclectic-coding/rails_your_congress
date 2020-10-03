Rails.application.routes.draw do

  root to: 'static#home'

  devise_for :users
  resources :users, only: [:show]

end
