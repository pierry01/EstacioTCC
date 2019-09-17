Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :menus, except: :show
    resources :events
    resources :users
    resources :items
  end
  
  namespace :site do
    resources :home, only: :index
    resources :contact_us, only: :create
    resources :events, only: [:show, :index]
    resources :comments, only: [:create, :destroy]
    post '/events/:id', to: 'appear#update'
    resources :schedule, only: :index
    
    namespace :cafe do
      resources :home, only: :index
      resources :comments, only: :create
      resources :menus, only: :show
    end
  end
  
  root to: 'site/home#index'
  
  devise_for :admins
  devise_for :users
end
