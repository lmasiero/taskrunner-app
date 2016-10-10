Rails.application.routes.draw do

  root 'main#index'

  resources :requests, :sessions, :users, :categories, :professionals, :services

  #get "professionals/signup", to: "professionals#new", as: "signup"
  post "/sessions/new" => "sessions#create"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # for passing date param into request/new/:date
  get "requests/new/:date" => "requests#new"
  post "requests/new/:date" => "requests#create"

end
