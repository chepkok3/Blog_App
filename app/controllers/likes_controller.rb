class LikesController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :post, through: :user

  def new; end

  def create
    @like = @post.likes.build(author: @user)

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
