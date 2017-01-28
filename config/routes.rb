Rails.application.routes.draw do
  root "recipes#new"
  resources :recipes, only: [:new, :create, :show]
end
