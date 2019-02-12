Rails.application.routes.draw do
  resources :posts

  resources :comments
  
  resources :users

  resources :tasks
  post '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status"
  post '/tasks/:id/toggle_claim', to: "tasks#toggle_claim", as: "toggle_claim"
  
  root 'session#new'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  get '/dice', to: "dices#home"
  post '/dice', to: "dices#create"
  get '/dice/form', to: "dices#form"
  post '/dice/form', to: "dices#roll"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
