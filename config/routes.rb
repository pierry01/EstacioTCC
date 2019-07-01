Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'
  
  namespace :backoffice do
    resources :events
    resources :users
  end
  
  namespace :site do
    resources :home, only: :index
    resources :events, only: :show
    resources :comments, only: :create
    post '/events/:id', to: 'appear#update'
    resources :schedule, only: :index
  end
  
  root to: 'site/home#index'
  
  devise_for :admins
  devise_for :users
end
