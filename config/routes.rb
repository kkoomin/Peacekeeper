Rails.application.routes.draw do
  resources :posts

  resources :comments
  
  resources :users

  resources :tasks
  post '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status"
  post '/tasks/:id/toggle_claim', to: "tasks#toggle_claim", as: "toggle_claim"
  get '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status_get"
  get '/tasks/:id/toggle_claim', to: "tasks#toggle_claim", as: "toggle_claim_get"

  
  
  root 'sessions#home'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  # resources :dices
  get '/dice', to: "dices#index", as: "index"
  post '/dice', to: "dices#create_new"
  get '/dices/:id/new', to: "dices#new", as: "enter_name"
  post '/dices/:id/new', to: "dices#create", as: "roll_dice"
  get '/dices/:id', to: "dices#show", as: "result"
  delete '/dices/:id', to: "dices#destroy", as: "replay"

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
