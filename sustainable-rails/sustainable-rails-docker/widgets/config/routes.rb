Rails.application.routes.draw do
  resources :widgets, only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
  get "manufacturer/:id", to: "manufacturers#show"
end
