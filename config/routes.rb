Rails.application.routes.draw do
  root 'users#new'

  resources :user_sessions, only: [:create,:destroy]
  resources :users
  resources :posts

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
