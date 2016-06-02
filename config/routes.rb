Rails.application.routes.draw do
  get 'recipes/index'
  resources :stores
  root 'welcome#index'
end
