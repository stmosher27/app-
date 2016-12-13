Links::Application.routes.draw do
  resources :users
  resources :links
  resources :comments
  resource :session
end
