require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(
      name: 'John',
      photo: 'https://person is inexistent.com',
      posts_counter: 0,
      bio: 'I am John, and I love sport'
    )
  end

  let(:post) do
    Post.create(
      title: 'Initial post',
      author: user,
      text: 'Working hard to become a developer.',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    Comment.new(
      text: 'This is my first comment',
      post:,
      author: user
    )
  end

  before { subject.save }

  describe 'Functionality' do
    context 'update comments_counter' do
      before do
        post.update(comments_counter: 0)
      end
      it 'updates the comments_counter of the post' do
        expect { subject.update_comments_counter }.to change { post.comments_counter }.from(0).to(1)
      end
    end
  end
end
