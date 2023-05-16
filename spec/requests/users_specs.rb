require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(
      name: 'Wednesday',
      photo: 'https://www.google.com',
      bio: 'Time for Ruby on Rails',
      posts_counter: 20
    )
  end

  before do
    get '/users'
  end

  describe 'User GET/ index ' do
    it 'returns user http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders template for the user' do
      expect(response).to render_template(:index)
    end

    it 'the user responsed with correct place holder' do
      expect(response.body).to include('List of users')
    end
  end

  describe "User GET /show'" do
    before do
      get "/users/#{user.id}"
    end

    it 'returns successful execution for detail user' do
      expect(response).not_to have_http_status(400)
    end

    it 'returns successful execution for detail user' do
      expect(response).to have_http_status(200)
    end

    it 'renders user detail template' do
      expect(response).to render_template(:show)
    end

    it 'renders user detail template' do
      expect(response).not_to render_template(:index)
    end

    it 'the user detail responsed body has correct place holder' do
      expect(response.body).to include('User detail with posts')
    end
  end
end
