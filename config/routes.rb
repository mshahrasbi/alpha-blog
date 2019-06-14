Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :articles
    
    # get 'pages/home', to: 'pages#home'
    # get 'pages/about', to: 'pages#about'
    root 'pages#home'
    get 'about', to: 'pages#about'

end
