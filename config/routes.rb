Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
    get '/posts/:id(.:format)' => 'posts#destroy', :as => 'delete_post'
end
