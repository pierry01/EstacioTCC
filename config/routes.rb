Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'
  
  namespace :backoffice do
    resources :events
  end
  
  namespace :site do
    get 'home/index'
    resources :events, only: :show
    resources :comments, only: :create
    post '/events/:id', to: 'appear#update'
  end
  
  root to: 'site/home#index'
  
  devise_for :admins
  devise_for :users
end
