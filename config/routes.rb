Rails.application.routes.draw do
  # Commented out "resources :comments" becauce of ActionCable
  # resources :comments
  
  # Added custom route for sign_in, sign_out, sign_up
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

<<<<<<< HEAD
  # This makes a websocket connection
=======
>>>>>>> actioncable
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
