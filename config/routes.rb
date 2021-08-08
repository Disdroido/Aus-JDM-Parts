Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :roles
  resources :listings
  root to: "home#index"

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete "sign_out", to: "devise/sessions#destroy"
  end
end
