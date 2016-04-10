Rails.application.routes.draw do
  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  root to: "static_pages#landing"

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  get "/auth/and_me/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/neanderthal", to: "users#neanderthal"

  get "/profile", to: "profiles#show"
  get "/profile/edit", to: "profiles#edit"
end
