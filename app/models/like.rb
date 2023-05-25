class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post

  after_save :update_post_like_counter

  private

  def update_post_like_counter
    Post.increment_counter(:likes_counter, post.id)
  end
end
