Rails.application.routes.draw do
  resources :suggestions
  devise_for :users
  root 'homes#index'
  resources :hearings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
