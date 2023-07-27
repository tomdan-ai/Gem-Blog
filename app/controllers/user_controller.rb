# class UserController < ApplicationController
#   def index; end

#   def show; end
# end

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
