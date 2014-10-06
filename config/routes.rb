Rails.application.routes.draw do
  root 'home#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
