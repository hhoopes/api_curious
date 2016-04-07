Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  get "/receive_code", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
