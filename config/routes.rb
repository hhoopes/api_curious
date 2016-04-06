Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/login", to: "sessions#new"

  resources :users, only: [:new]
  get "/receive_code", to: "and_me_oauth#receive_code"
end
