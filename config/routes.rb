Rails.application.routes.draw do
  resources :abouts, only: [:index]
  resources :categories
  resources :posts, only: [:index, :new, :create, :edit, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/home/index'
root 'home#index'

get '*path' => redirect('/')
end
