Rails.application.routes.draw do
  root 'posts#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :posts do
      resources :comments
  end

    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/posts/:id(.:format)' => 'posts#destroy', :as => 'delete_post'
end
