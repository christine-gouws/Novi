Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "feed", to: "pages#feed", as: :feed
  get "profile", to: "pages#profile", as: :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :brands, only: [:show]
  resources :posts, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :ratings, only: [:create]
end
