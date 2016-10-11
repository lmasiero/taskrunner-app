Rails.application.routes.draw do

  root 'main#index'

  resources :requests, :sessions, :users, :categories, :professionals
  resources :professionals do
    resources :services
  end
  #get "professionals/signup", to: "professionals#new", as: "signup"
  post "/sessions/new" => "sessions#create"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
