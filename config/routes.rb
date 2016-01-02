Rails.application.routes.draw do
  resources :users
  root "comments#index"

  resources :links
  resources :domains
  resources :comments
end
