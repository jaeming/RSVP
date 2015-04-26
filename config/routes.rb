Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root 'home#index'

  resources :events do
    resources :guests
  end


  namespace :api do
    resources :guests, only: [:create]
  end

end
