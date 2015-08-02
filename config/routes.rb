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
	  end
	end

  get '/professional/:id/edit_profpic'     => 'professionals#edit_profpic', as:'professional/edit_profpic'
  patch '/professional/:id/edit_profpic'   => 'professionals#update_profpic'
  get '/users/:id/edit_profpic'            => 'users#edit_profpic', as:'user/edit_profpic'
  patch '/users/:id/edit_profpic'          => 'users#update_profpic'

  resources :professionals
  resources :reservations
  resources :reviews, only: [:new, :create]
end
