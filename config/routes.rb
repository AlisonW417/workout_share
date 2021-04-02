Rails.application.routes.draw do
  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :workouts do 
      resources :comments, only: [:new, :index]
  end 
  resources :users, only: [:new, :create, :show]
  resources :comments, only: [:new, :create, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
