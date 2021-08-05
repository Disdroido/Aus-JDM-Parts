Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :roles
  resources :listings
  root to: "home#index"

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end  
end
