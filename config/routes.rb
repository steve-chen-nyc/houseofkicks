Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts do
      resources :comments
  end

    get '/posts/:id(.:format)' => 'posts#destroy', :as => 'delete_post'
end
