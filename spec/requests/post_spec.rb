require 'rails_helper'

describe 'Get all posts from user' do
  let(:user) { User.create!(name: 'Test User No.1', posts_counter: 0) }

  it 'returns a successful response' do
    get "/users/#{user.id}/posts"

    expect(response).to be_successful
    expect(response.body).to include('<h1>This is a list of posts from one user!</h1>')
    expect(response).to render_template(:index)
  end
end

describe 'Get specific post from user' do
  let(:user) { User.create!(name: 'Test User', posts_counter: 0) }

  it 'returns a successful response' do
    post = Post.create!(title: 'Test Post', author_id: user.id, comments_counter: 0, likes_counter: 0)
    get "/users/#{user.id}/posts/#{post.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>This is one post from user!</h2>')
    expect(response).to render_template(:show)
  end
end
