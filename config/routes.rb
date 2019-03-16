require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :suggestions do
    post '/reject', to: 'suggestions#reject'
    post '/approve', to: 'suggestions#approve'
  end
  root 'homes#index'
  resources :hearings
  resources :users
  resources :invites
  resources :administrations
  post '/approve', to: 'invites#approve'
  mount Sidekiq::Web => '/sidekiq'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
