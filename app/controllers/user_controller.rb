
class UserController < ApplicationController
  before_action :set_user, only: %i[index show]
  before_action :set_post, only: %i[show_comments add_comment]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def show_posts
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def show_comments
    @comments = @post.comments

    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def add_comment
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      render json: { status: 'Comment added successfully.' }, status: :created
    else
      render json: { error: 'Failed to add the comment.' }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
