Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  end
  root 'posts#index'
end