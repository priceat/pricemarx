Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #post :incoming, to: 'incoming#create'
  mount_griddler

  resources :users
  resources :sessions
  resources :tags
  resources :incoming
  resources :pricemarks do
    resources :favorites, only: [:create, :destroy]
  end
  
  root to: 'users#new'

end
