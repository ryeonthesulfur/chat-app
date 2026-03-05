Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update, :destroy]
  resources :rooms, only: [:new, :create]

end
