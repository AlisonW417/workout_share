Rails.application.routes.draw do
  resources :comments
  resources :workouts
  resources :users
  get '/', to: 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
