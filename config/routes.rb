Rails.application.routes.draw do  
  # post 'sessions' => 'sessions#create'

  resources :sessions, only: [:create]
  resources :users, only: [:create, :show]
  resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
