Rails.application.routes.draw do
  resources :search_suggestions
  apipie
  devise_for :app_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  root 'welcome#index'
  get 'alive', :to => 'welcome#alive'
  post 'match', :to => 'matcher#match'

  # shopping lists
  resources :shopping_lists do
    resources :list_items, :only => [:new, :create]
  end
  # API Endpoints
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'stores', :to => 'store#list_stores'
      get 'stores/:store_id', :to => 'store#store_items'
      get 'lists', :to => 'list#index'
      get 'user', :to => 'user#logged_in'
    end
  end
end
