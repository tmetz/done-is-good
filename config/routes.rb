Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/goals/all' => 'goals#all'
  patch '/tasks/adduser' => 'tasks#adduser'
  get '/activeusers' => 'users#active'
  #get '/auth/facebook/callback' => 'sessions#fbcreate'
  get '/auth/github/callback' => 'sessions#ghcreate'
  
  resources :tasks
  resources :incentives
  resources :goals do
    resources :tasks, only: [:new, :index, :edit]
    resources :incentives, only: [:new, :index]
  end
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
