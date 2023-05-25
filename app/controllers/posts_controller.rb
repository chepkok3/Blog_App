class PostsController < ApplicationController
  before_action :set_user, only: %i[index show new create destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show; end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
