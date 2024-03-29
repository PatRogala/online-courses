Rails.application.routes.draw do
  resources :widgets, only: [ :show, :index, :new, :create ]
  resources :widget_ratings, only: [ :create ]

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :customer_service do
    resources :widgets, only: [ :show, :update, :destroy ]
  end

  if Rails.env.development?
    resources :design_system_docs, only: [ :index ]
  end

  ####
  # Custom routes start here
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declarated above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get "/amazing", to: "widgets#index"
end
