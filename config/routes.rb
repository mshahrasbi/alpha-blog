Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  
    # get 'pages/home', to: 'pages#home'
    # get 'pages/about', to: 'pages#about'
    root 'pages#home'
    get 'about', to: 'pages#about'

    get 'signup', to: 'users#new'
    #
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    #
    # post 'users', to: 'users#create'    # this will you 'users_path'
    # OR
    resources :users, except: [:new]      # basicly we want all the routes except new user route
end
