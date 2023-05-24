require 'rails_helper'

describe 'Get user details' do
  let(:user) { User.create!(name: 'Test User', bio: 'Test bio', posts_counter: 0) }

  it 'returns a successful response and renders user details' do
    get "/users/#{user.id}"

    expect(response).to be_successful
    expect(response).to render_template(:show)

    expect(response.body).to include(user.bio)

    user.recent_posts.each do |post|
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.text)
    end
  end
end
