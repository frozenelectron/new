Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about_us", to: "about#index", as: :about # as: makes the prefix as you want.
  get "", to: "main#index" # "" means root (think of it as a blank url), which also means
  root "main#index"
  # "/" defines the root path route

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  delete "logout", to: "sessions#delete"

end
