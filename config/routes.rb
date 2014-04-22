Rails.application.routes.draw do
  # Root application path
  root 'welcome#index'

  # Article resources for Article CRUD operations
  resources :articles
end
