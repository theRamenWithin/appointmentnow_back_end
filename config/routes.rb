Rails.application.routes.draw do
  resources :events
  resources :bookings
  resources :organizations
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
