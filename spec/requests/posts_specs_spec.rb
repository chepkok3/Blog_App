require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(
      name: 'Thursday',
      photo: 'https://www.google.com',
      bio: 'I am a Ruby on Rails developer',
      posts_counter: 10
    )
  end

  let!(:post) do
    Post.create(
      title: 'Ruby',
      text: 'Ruby is a programming language',
      author: user,
      comments_counter: 10,
      likes_counter: 10
    )
  end

  describe 'GET /index' do
    before do
      get "/users/#{user.id}/posts"
    end

    it 'renders posts template' do
      expect(response).to render_template(:index)
    end

    it 'the post response body has correct placeholder text' do
      expect(response.body).to include('list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'returns successful execution for detail post ' do
      expect(response).to have_http_status(200)
    end

    it 'renders post detail template' do
      expect(response).to render_template(:show)
    end

    it 'the post detail response body has correct placeholder text' do
      expect(response.body).to include('Post detail with comments')
    end
  end
end
