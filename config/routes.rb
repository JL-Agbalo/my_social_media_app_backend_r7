Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # User routes
  post "/signup", to: "users#create"
  get "/users", to: "users#index"

  # Authentication routes
  post "/login", to: "authentication#login"

  # Post routes
  resources :posts, only: [:index, :show, :create, :update, :destroy]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end