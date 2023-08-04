module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!
      respond_to :json
      def index
        user = User.find(params[:user_id])
        posts = user.posts
        respond_with posts
      end
    end
  end
end
