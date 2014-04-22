Rails.application.routes.draw do
  # Root application path
  root 'articles#index'

  # Article resources for Article CRUD operations
  resources :articles
end
