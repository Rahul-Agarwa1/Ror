Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'  -- or
  resources :users, except: [:new]
  resources :articles#, only: [:show, :index, :new, :create, :edit , :update, :destroy]
end
