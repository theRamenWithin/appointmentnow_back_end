Rails.application.routes.draw do
  # resources :organization_roles
  # resources :events
  # resources :bookings
  # resources :organizations
  # resources :addresses
  
  resources :users, only: [:create, :show, :index]

  
  post '/sign_up', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  post '/organisation/search', to: 'organizations#search'
  get '/organisation/namecheck', to: 'organizations#show'
  post '/organisation/create', to: 'organizations#create'
  post '/organisation/join', to: 'organization_roles#create'
  get 'organisation/org_routes', to: 'application#org_routes'
  
end