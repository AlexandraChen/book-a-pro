Rails.application.routes.draw do  
  devise_for :users
  root 'sites#index'
  devise_scope :user do ## delete and use proper route
    get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  get '/users/profile'            => 'users#show', as: 'user'
  get '/reservations'             => 'reservations#reservations'

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

  resources :professionals
  resources :reservations
  resources :reviews, only: [:new, :create]

  resources :users, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    resources :professionals, only: [:index]
  end
end
