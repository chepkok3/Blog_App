require_relative './rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'Loren',
      photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      posts_counter: 0,
      bio: 'I am Loren, and I love sport.'
    )
  end

  subject do
    Post.new(
      title: 'My first post',
      author: user,
      text: 'The motivation to become developer is very big.',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative comments_counter' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative likes_counter' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid when title is longer than 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
  end
  describe 'Functionality' do
    before { user.update(posts_counter: 0) } # reset posts_counter to 0

    context 'create comments' do
      it 'returns the 5 most recent comments' do
        10.times do |i|
          Comment.create(
            text: "Comment #{i}",
            post: subject,
            author: user
          )
        end

        expect(subject.recent_comments.count).to eq(5)
      end
    end

    context 'update posts_counter' do
      it 'updates the posts_counter of the author' do
        expect { subject.update_post_counter }.to change { user.posts_counter }.from(0).to(1)
      end
    end
  end
end
