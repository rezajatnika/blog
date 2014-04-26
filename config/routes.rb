Rails.application.routes.draw do
  # URLs
  match 'login', to: 'sessions#new', via: 'get'
  match 'logout', to: 'sessions#destroy', via: 'delete'

  # Root application path
  root 'articles#index'

  # Article resources for Article CRUD operations
  resources :articles

  # User resources
  resources :users

  # Session resources
  resources :sessions
end
