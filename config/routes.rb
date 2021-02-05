Rails.application.routes.draw do
  # resources :organization_roles
  # resources :events
  # resources :bookings
  
  # resources :addresses
  
  resources :users, only: [:create, :show, :index]
  resources :organizations
  
  post '/sign_up', to: 'users#create'

  # Session Routes
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  # Organisation routes
  post '/organisation/search', to: 'organizations#search'
  post '/organisation/namecheck', to: 'organizations#show'
  post '/organisation/create', to: 'organizations#create'
  post '/organisation/join', to: 'organization_roles#create'

  # User routes
  get '/users/show', to: 'users#show'

  # Routing data for React
  get 'organisation/org_routes', to: 'organizations#org_routes'
  
end