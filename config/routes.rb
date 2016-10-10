Rails.application.routes.draw do
  get 'service/index'

  get 'service/create'

  get 'service/new'

  get 'service/edit'

  get 'service/show'

  get 'service/update'

  get 'service/destroy'

  root 'main#index'

  resources :requests, :sessions, :users, :categories, :professionals, :services


  get "users/signup"
  #get "professionals/signup", to: "professionals#new", as: "signup"

  post "/sessions/new" => "sessions#create"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
