Rails.application.routes.draw do
  resources :albums
  devise_for :users
  get 'welcome/hello'
  get 'welcome/dashboard'
  get 'welcome/status'
  get 'welcome/configuration'
  get 'welcome/home'

  get '/pictures/missing_thumbnails' => 'pictures#thumbnails' , :as =>"missing_thumbs"
  get '/pictures/missing_metadata' => 'pictures#metadata' , :as =>"missing_metadata"
  get '/people/:id/matcher' => 'people#matcher' , :as =>"matcher"

  resources :pictures
  resources :people

  #get '/patients/:id', to: 'patients#show'

  #get '/paths/scan/:id', to "paths#scan"
  #match '/invoices/:id/send' => 'invoices#send_invoice'
  get '/paths/:id/scan' => 'paths#scan' , :as =>"path_scan"
  resources :paths

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#hello'

end
