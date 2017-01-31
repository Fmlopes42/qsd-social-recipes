Rails.application.routes.draw do
  root "recipes#index"
  resources :recipes, only: [:index, :new, :create, :show]
  resources :cuisines, only: [:new, :create, :show]
  resources :food_types, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]
  get '/search', to: 'recipes#search'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
