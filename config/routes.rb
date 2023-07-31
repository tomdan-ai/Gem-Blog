# Rails.application.routes.draw do
#   get '/user', to: 'user#index', as: 'users'
#   get '/user/:id', to: 'user#show', as: 'user'
#   get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
#   get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
# end
 

Rails.application.routes.draw do
  root 'user#index'
  get '/user', to: 'user#index', as: 'users'
  get '/user/:id', to: 'user#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resource :likes, only: [:create]
  end
end


