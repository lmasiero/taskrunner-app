Rails.application.routes.draw do
  root 'main#index'

  resources :requests, :sessions, :users, :categories, :professionals

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
