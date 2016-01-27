Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  root 'welcome#index'
  get 'alive', :to => 'welcome#alive'
end
