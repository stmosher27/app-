Rails.application.routes.draw do

  # get '/users' => 'users#index'
  # get '/users/new' => 'users#new', :as => 'new_user'
  # get '/users/:id/edit' => 'users#edit', :as => 'edit_user'
  # get '/users/:id' => 'users#show', :as => 'user'
  # post '/users' => 'users#create'
  # patch '/users/:id' => 'users#update'
  # put '/users/:id' => 'users#update'
  # delete '/users/:id' => 'users#destroy'

  resources(
    :contacts,
    :only => [:create, :destroy, :show, :update]
  )

  resources :contact_shares, :only => [:create, :destroy]

  resources :users, :only => [:index,:create, :destroy, :show, :update] do
    resources :contacts, :only =>[:index]
  end

end
