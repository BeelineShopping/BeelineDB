Rails.application.routes.draw do
  apipie
  devise_for :app_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  root 'welcome#index'
  get 'alive', :to => 'welcome#alive'

  # API Endpoints
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'stores', :to => 'store#list_stores'
    end
  end
end
