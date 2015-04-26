Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  resources :guests
  resources :events

  namespace :api do
    resources :guests, only: [:create]
  end

end
