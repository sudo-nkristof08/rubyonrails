Rails.application.routes.draw do
  resources :bids
  resources :cars
  resources :users
  
  get 'users/:id/bids', to: 'users#view_bids'
  get 'users/:id/cars', to: 'users#view_cars'
  
  get 'home/login'
  get 'home/signup'
  
  root "home#login"
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
