Rails.application.routes.draw do
  root to: "gardens#index"

  # 7 crud actions (i can view all, one, create, update and delete)
  resources :gardens do
    # that it's gonna have gardens/:garden_id/plants/new [GET]
    # that it's gonna have gardens/:garden_id/plants [POST]
    resources :plants, only: [:new, :create]
  end

  # I prefer plants/:id [GET]
  # than gardens/:garden_id/plants/:id [GET]

  resources :plants, only: [:show, :destroy] do
    resources :plant_tags, only: :create
  end

  # resources :plant_tags, only: :create


  resources :tags, only: [:index, :new, :create]
end
