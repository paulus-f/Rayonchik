# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :suggestions, path: 'suggestions/all', only: %w[index show]
  root 'homes#index'
  resources :hearings
  resources :users
  resources :invites
  resources :active_suggestions, path: 'suggestions/active',controller: 'suggestions', type: 'ActiveSuggestion'
  resources :archived_suggestions, path: 'suggestions/archived', controller: 'suggestions', type: 'ArchivedSuggestion', except: %w[edit new]
  resources :pending_suggestions, path: 'suggestions/pending', controller: 'suggestions', type: 'PendingSuggestion', except: %w[edit new]
  resources :voting_suggestions, path: 'suggestions/voting', controller: 'suggestions', type: 'VotingSuggestion', except: %w[edit new]
  post '/approve', to: 'invites#approve'
  post '/rate', to: 'suggestions#rate'
  mount Sidekiq::Web => '/sidekiq'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
