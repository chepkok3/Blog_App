class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_post_comment_counter
  after_destroy :decrement_post_comment_counter

  private

  def update_post_comment_counter
    Post.increment_counter(:comments_counter, post.id)
  end

  def decrement_post_comment_counter
    Post.decrement_counter(:comments_counter, post.id)
  end
end
