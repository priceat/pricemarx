Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "pricemarks/my_index"

  mount_griddler

  resources :users
  resources :sessions
  resources :tag
  resources :incoming
  resources :pricemarks do
    resources :favorites, only: [:create, :destroy]
  end
  
  root to: 'pricemarks#index'

end
