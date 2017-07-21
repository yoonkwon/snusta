Rails.application.routes.draw do
  root 'users#index'

  resources :user_sessions
  resources :users
  resources :posts

  get 'login' => 'user_sessions#new', as: :login
  get 'logout' => 'user_sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
