Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users, only:[] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create] 
        end
      end
     resources :sessions, only: [:create, :destroy]
    end
  end
end
