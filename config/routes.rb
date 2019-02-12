Rails.application.routes.draw do
  resources :posts
  resources :comments
  
  resources :users

  resources :tasks
  post '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status"
  
  # root 'session#new'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
