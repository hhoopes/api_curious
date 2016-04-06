Rails.application.routes.draw do
  root to: "static_pages#landing"

  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new]
  get "/receive_code", to: "sessions#receive_code"
end
