Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'  -- or
  resources :users, except: [:new]
  resources :articles#, only: [:show, :index, :new, :create, :edit , :update, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
