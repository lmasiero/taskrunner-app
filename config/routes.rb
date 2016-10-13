Rails.application.routes.draw do

  root 'main#index'

  resources :sessions, :users, :categories, :professionals, :block_times
  resources :professionals do
    resources :services
  end

  resources :requests
  patch "/requests/:id" => "requests#change_status"

  #get "professionals/signup", to: "professionals#new", as: "signup"
  post "/sessions/new" => "sessions#create"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"


end
