Demo::Application.routes.draw do
  
  resources :blogs do
    resources :posts
  end
  resources :posts
  resources :roles
  resources :users

  root :to => "application#index"
end
