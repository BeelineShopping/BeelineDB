Rails.application.routes.draw do
  resources :stores
  root 'welcome#index'
end
