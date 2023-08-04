class PostsController < ApplicationController
  load_and_authorize_resource # except: %i[index show]
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])

    respond_to do |format|
      format.html # Render an HTML view (if needed)
      format.json { render json: @post } # Render the post as JSON
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(user_id: current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.author
    @post.destroy
    redirect_to user_path(@user), notice: 'Post was successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
