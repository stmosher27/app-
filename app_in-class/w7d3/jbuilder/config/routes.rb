Rails.application.routes.draw do
 # Your routes here!
  namespace :api, defaults: { format: :json } do
    resources :guests, only: [:index, :show] do
      resources :gifts, only: [:index]
    end
    resources :gifts, only: [:show]
    resources :invitations, only: [:index, :show]
    resources :parties, only: [:index, :show]
  end
end
