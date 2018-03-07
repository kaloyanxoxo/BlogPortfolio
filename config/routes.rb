Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :abouts, only: [:index]
  resources :categories 
  resources :posts

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
  
get '/home/index'
root 'home#index'

get "/signup", to: "users#new"

get '*path' => redirect('/')
end
