Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :roles
  resources :listings
  root to: "home#index"

  get 'profile/:id', to: 'users#show', as: :profile

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete "sign_out", to: "devise/sessions#destroy"
  end

  post "listings/add_to_cart/:id", to: "listings#add_to_cart", as: "add_to_cart"
  delete "listings/remove_from_cart/:id", to: "listings#remove_from_cart", as: "remove_from_cart"
end
