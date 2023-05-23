require 'rails_helper'

describe 'get users from /users' do
  it 'returns a successful response' do
    get '/users'

    expect(response).to be_successful
    expect(response.body).to include('<h1>This is a list of posts from one user!</h1>')
    expect(response).to render_template(:index)
  end
end

describe 'get users from /users/:id' do
  it 'returns a successful response' do
    user = User.create!(name: 'Test User No.1', posts_counter: 0)
    get "/users/#{user.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>This is one post from user!</h2>')
    expect(response).to render_template(:show)
  end
end
