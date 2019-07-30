Rails.application.routes.draw do
  resources :tasks
  resources :incentives
  resources :goals do
    resources :tasks, only: [:new, :index, :edit]
    resources :incentives, only: [:new, :index]
  end

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  get '/auth/facebook/callback' => 'sessions#fbcreate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
