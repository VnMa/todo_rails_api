Rails.application.routes.draw do  
  # post 'sessions' => 'sessions#create'

  resources :sessions, only: [:create]
  resources :users, only: [:create, :index, :show]

  post 'users/welcome' => 'users#welcome'

  resources :todos

  resources :account_activations
  get 'account_activations/:id/edit' => 'account_activations#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
