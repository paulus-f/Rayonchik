Rails.application.routes.draw do
  resources :suggestions
  root 'homes#index'
  resources :hearings
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
