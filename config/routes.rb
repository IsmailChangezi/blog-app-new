Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root :to => 'users#index'
      resources :users, only: [:index, :show] do
        resources :posts do
        resources :comments, only: [:new, :create]
        resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:new, :create]
        end
      end
      get "api/users/:author_id/posts", to: "api/posts#index"
      get "api/users/:author_id/posts/:id", to: "api/comments#index"
      post "api/users/:author_id/posts/:id/comments/new", to: "api/comments#create"
    
end