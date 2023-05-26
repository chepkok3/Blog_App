class LikesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = User.find(params[:post_id])
    @like = @post.likes.build(params[:like])
    @like.author = @user

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
