Rails.application.routes.draw do  
  devise_for :users
  root 'sites#index'
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  get '/users/profile/:user' => 'users#show', as: 'user'
end
