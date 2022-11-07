Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users 
  resources :bids
  resources :cars

  
  get 'users/:id/bids', to: 'users#view_bids'
  get 'users/:id/cars', to: 'users#view_cars'
  
  
  root "cars#index"
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
