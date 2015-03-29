Rails.application.routes.draw do
  root 'home#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :customers do
    collection {get :search}
    resources :credit_items
  end
  resources :categories
end
