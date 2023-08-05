Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  resources :users do
    resources :posts do
      resources :likes, only: [:create]
      resources :comments, only: [:new, :create]
    end
  end

  delete "/posts/:id", to: "posts#destroy", as: :destroy_post
  delete "/posts/:post_id/comments/:id", to: "comments#destroy", as: :destroy_comment

  root to: "users#index"

namespace :api do
  namespace :v1 do
    resources :users do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end


end
