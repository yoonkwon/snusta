Rails.application.routes.draw do
  root 'posts#index'

  resources :user_sessions, only: [:create,:destroy]
  resources :users
  resources :posts

  resources :profiles, param: :name, only: [:show, :edit, :update], constraints: { :name => /[0-z\.]+/ }

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
