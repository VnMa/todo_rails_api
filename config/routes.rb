Rails.application.routes.draw do  
  get 'password_resets/new'
  get 'password_resets/edit'
  # post 'sessions' => 'sessions#create'

  resources :sessions, only: [:create]
  resources :users, only: [:create, :index, :show]

  post 'users/welcome' => 'users#welcome'

  resources :todos

  resources :account_activations
  get 'account_activations/:id/edit' => 'account_activations#edit'

  resources :password_resets
  get 'account_activations/:id/edit' => 'password_resets#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
