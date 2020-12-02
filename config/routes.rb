Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :likes, only: [:create]
  resources :ingredients
  resources :recipes
  resources :users

  delete "/sessions/logout", to: 'sessions#logout', as: 'logout'
  get "/sessions/new", to: 'sessions#new', as: 'new_login'
  post '/sessions/login', to: 'sessions#login', as: 'login'

  post '/recipes/:id', to: 'likes#create', as: 'like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
