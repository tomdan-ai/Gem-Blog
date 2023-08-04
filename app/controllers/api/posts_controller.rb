# app/controllers/api/posts_controller.rb

module Api
    class PostsController < ApplicationController
      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.includes(:comments)
        render json: @posts
      end
    end
  end
  