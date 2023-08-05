# app/controllers/api/v1/comments_controller.rb

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post

      def create
        comment = @post.comments.build(comment_params)
        comment.user = current_user

        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        comments = @post.comments
        render json: comments
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
