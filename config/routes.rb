Rails.application.routes.draw do
  resources :tasks
  resources :incentives
  resources :goals do
    resources :tasks, only: [:new, :index]
    resources :incentives, only: [:new, :index]
  end

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
