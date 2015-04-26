Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root 'home#index'

  resources :guests
  resources :events

  namespace :api do
    resources :guests, only: [:create]
  end

end
