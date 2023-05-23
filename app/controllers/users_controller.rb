class UsersController < ApplicationController
  def index
    @users = User.all
    @post = Post.new
    # @user = User.all.first
  end

  def show
    @user = User.find(params[:id])
  end
end
