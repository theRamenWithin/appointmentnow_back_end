Rails.application.routes.draw do
  resources :events
  resources :bookings
  resources :organizations
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'users/login', to: 'sessions#create'
  delete 'users/logout', to: 'sessions#destroy'
  get 'users/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index]
end
