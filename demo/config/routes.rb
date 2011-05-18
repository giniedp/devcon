Demo::Application.routes.draw do
  
  resources :roles
  resources :users do
    resources :blogs do
      resources :posts
    end
  end

  namespace :api do
    resources :users
    resources :posts
  end
  
  root :to => "application#index"
end
