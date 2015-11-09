Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
   resources :pins
   resources :users, only: [:show]
   root "pins#index"
end
