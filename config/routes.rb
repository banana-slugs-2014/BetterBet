Betterbet::Application.routes.draw do

  root to: "dashboard#index"
  get '/dashboard', to: 'dashboard#index'

  get '/users/autocomplete', to: 'users#autocomplete', as: 'autocomplete_users'
  get '/auth/:provider/callback', to: 'sessions#facebook_signup'

  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  resources :friendships, only: [:create, :destroy]

  resources :users
  get '/signup', to: 'users#new'

  resources :goals, except: [:show, :index]
  put '/goals/:id/complete', to: 'goals#complete', as: 'complete_goal'

  mount Soulmate::Server, :at => '/sm'
end
