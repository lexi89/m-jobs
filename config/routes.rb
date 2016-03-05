Rails.application.routes.draw do

  root "companies#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # devise_scope :user do
  #   delete 'sign_out',
  #   :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #   end
  get "users/:id" => "users#show", as: :user
  get "users/:id/applications" => "users#applications", as: :user_applications
  resources :industries, only: [:show, :edit, :update, :destroy]
  resources :categories, only: [:show, :edit, :update, :destroy]
  resources :companies do
    resources :jobs, except: [:index]
    collection { post :import }
    get :autocomplete_company_name, on: :collection
    post :claim
  end
  resources :applications, only: [:create, :destroy]
  resources :interests, only: [:index, :create, :destroy]
end
