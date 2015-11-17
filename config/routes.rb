Rails.application.routes.draw do  
  #devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  devise_for :users, controllers: { registrations: "registrations" }
 
  root 'sites#index'
  devise_scope :user do ## delete and use proper route
    get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  get '/users/profile'     => 'users#show', as: 'user'
  get '/reservations'      => 'reservations#reservations'
  get '/pro_sign_up'       => 'users#pro_sign_up'

  resources :users, only: [:edit] do
	  collection do
      get 'edit_password' 
	    patch 'update_password'
      get 'edit_profile' 
      patch 'update_profile'
      get 'edit_profpic'
      patch 'update_profpic'
	  end
	end

  resources :professionals, only: [:edit] do
    collection do
      get 'edit_password' 
      patch 'update_password'
      get 'edit_profile' 
      patch 'update_profile'
      get 'edit_profpic'
      patch 'update_profpic'
    end
  end

  resources :professionals, except: [:destroy]
  resources :reservations, only: [:create]
  resources :reviews, only: [:new, :create]

  # resources :users, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    resources :professionals, only: [:index]
  end

end
