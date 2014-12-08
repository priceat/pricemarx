Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post :incoming, to: 'incoming#create'

  resources :users
  resources :sessions
  resources :pricemarks
  resources :topics

  root to: 'pricemarks#index'

end
