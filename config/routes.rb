Rails.application.routes.draw do
  devise_for :users
  get 'welcome/hello'
  get 'welcome/dashboard'
  get 'welcome/status'
  get 'welcome/configuration'
  get 'welcome/home'
  resources :pictures
  resources :paths
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#hello'

end
