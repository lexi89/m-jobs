Rails.application.routes.draw do
  root "companies#index"
  devise_for :users
  resources :users, only: :show
  resources :industries, only: [:show, :edit, :update, :destroy]
  resources :categories, only: [:show, :edit, :update, :destroy]
  resources :companies do
    resources :jobs, except: [:index]
    collection { post :import }
  end
  resources :interests, only: [:index, :create, :destroy]
end
