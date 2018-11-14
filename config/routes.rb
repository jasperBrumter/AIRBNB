Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :boats
  get "/profile", to: 'pages#profile', as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/boats/:boat_id/reviews/new", to: "reviews#new", as: "new_boat_review"
  post "/boats/:boat_id/reviews", to: "reviews#create", as: "boat_reviews"
end
