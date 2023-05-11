require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      photo: 'https://non-existing-photo.com',
      posts_counter: 0,
      bio: 'I am John, and I love sport'
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative posts_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    context 'get recent posts' do
      it 'returns 2 recent posts' do
        5.times do |i|
          Post.create(
            title: "Post #{i}",
            author: subject,
            text: 'Working hard to become a developer.',
            comments_counter: 0,
            likes_counter: 0
          )
        end

        expect(subject.recent_posts.count).to eq(2)
      end
    end
  end
end
