Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "feed", to: "pages#feed", as: :feed
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :brands, only: [:show]
  resources :posts, only: [:create]
  resources :followings, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :ratings, only: [:create, :destroy]


end
