class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(user_id: @post.author, id: @post), notice: 'Comment was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    @comment.destroy
    redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
