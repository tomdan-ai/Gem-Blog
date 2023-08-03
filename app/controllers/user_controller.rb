# class UserController < ApplicationController
#   def index
#     @users = User.includes(:posts)
#   end

#   def show
#     @user = User.find(params[:id])
#     @posts = @user.posts.includes(:comments)
#   end
# end


class UserController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:comments)
  end
end
