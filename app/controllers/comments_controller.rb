class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user

    @comment = Comment.create(author: @user, post: @post, text: comments_params['text'])
    # @post.comments.create(comments_params(@user))

    if @comment.valid?
      # @comment.update_comments_counter(@post)
      redirect_to user_post_path(@user, @post), notice: 'The comment is created'
    else
      redirect_to new_post_comment_path(@user, @post), alert: 'The comment was not created'
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
    # comment[:author] = author
    # comment
  end
end
