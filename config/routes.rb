Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  resources :amenities
  resources :cities
  resources :roles
  resources :cities
  resources :rooms
  resources :my_rooms
  resources :amenity_rooms
  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
