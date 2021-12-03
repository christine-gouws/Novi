Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "feed", to: "pages#feed", as: :feed
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "about", to: "pages#about", as: :about
  get "registration", to: 'pages#registration', as: :brand_registration
  get "thankyou", to: 'pages#thankyou', as: :thankyou
  get "landing", to: 'pages#landing', as: :landing
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :edit, :update]

  resources :brands, only: [:show, :index]
  resources :posts, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :ratings, only: [:create]
end
