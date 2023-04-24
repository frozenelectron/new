Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about_us", to: "about#index", as: :about # as: makes the prefix as you want.
  get "", to: "main#index"
  root "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
