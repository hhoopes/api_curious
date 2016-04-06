Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/login", to: "sessions#new"

  resources :users, only: [:new]

  get "/auth/23andme", as: :twenty_three_and_me_login
  get "/auth/23andme/callback", to: "sessions#create"
end
