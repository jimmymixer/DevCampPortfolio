Rails.application.routes.draw do

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  resources :blogs

  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


end
