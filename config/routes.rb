Rails.application.routes.draw do  
  devise_for :users
  root 'sites#index'
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  get '/users/profile/:user'               => 'users#show', as: 'user'
  get '/users/profile/edit_password/:user' => 'users#edit_password', as: "user/edit_password"

  resources :users, only: [:edit] do
	  collection do
	    patch 'update_password'
	  end
	end

	resources :users, only: [:show] do
		resources :professionals
	end

end
