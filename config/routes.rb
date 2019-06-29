Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end
  
  root to: 'site/home#index'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
