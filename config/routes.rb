Rails.application.routes.draw do
  resources :users
  resources :abouts, only: [:index]
  resources :categories 
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/home/index'
root 'home#index'

get '*path' => redirect('/')
end
