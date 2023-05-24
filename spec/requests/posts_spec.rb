require 'rails_helper'

describe 'Get all posts from user' do
  let(:user) { User.create!(name: 'Test User No.1', posts_counter: 0) }

  it 'returns a successful response' do
    get "/users/#{user.id}/posts"

    expect(response).to be_successful
    expect(response).to render_template(:index)
  end
end
