Rails.application.routes.draw do
  resources :stores
  root 'welcome#index'
  get 'alive', :to => 'welcome#alive'
end
