Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root :to => 'users#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts do
        resources :comments, only: [:new, :create]
        resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:new, :create]
        end
      end
    end 
  end
      resources :users, only: [:index, :show] do
        resources :posts do
        resources :comments, only: [:new, :create]
        resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:new, :create]
        end
      end
end