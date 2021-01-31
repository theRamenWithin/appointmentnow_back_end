Rails.application.routes.draw do
  resources :organization_roles
  resources :events
  resources :bookings
  resources :organizations
  resources :addresses
  
  resources :users, only: [:create, :show, :index]

  post '/sign_up', to: 'users#create'  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end