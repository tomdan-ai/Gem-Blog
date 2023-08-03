# class LikesController < ApplicationController
#   def create
#     @user = current_user
#     @post = Post.find(params[:post_id])
#     @like = Like.new(author: @user, post: @post)

#     if @like.save
#       redirect_to user_post_path(user_id: @post.author, id: @post), notice: 'Post liked successfully.'
#     else
#       redirect_to user_post_path(user_id: @post.author, id: @post), alert: 'Failed to like the post.'
#     end
#   end
# end

class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(author: @user, post: @post)

    if @like.save
      redirect_to user_post_path(user_id: @post.author, id: @post), notice: 'Post liked successfully.'
    else
      redirect_to user_post_path(user_id: @post.author, id: @post), alert: 'Failed to like the post.'
    end
  end
end
