Rails.application.routes.draw do
  resources :roles
  resources :listings
  root to: "home#index"

  devise_for :users

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end  
end
