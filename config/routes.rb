Rails.application.routes.draw do
  devise_for :users
  root 'user#index'

  get '/user', to: 'user#index', as: 'users'
  get '/users/:id', to: 'user#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
    resource :likes, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      get 'comments/index'
      get 'comments/create'
      get 'posts/index'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end
end
