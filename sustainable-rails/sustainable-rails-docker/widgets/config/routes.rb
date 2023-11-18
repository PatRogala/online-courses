Rails.application.routes.draw do
  resources :widgets

  # Defines the root path route ("/")
  # root "posts#index"
  get "manufacturer/:id", to: "manufacturers#show"
end
