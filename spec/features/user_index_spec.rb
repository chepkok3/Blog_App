require 'rails_helper'
require 'capybara'

RSpec.describe 'User index page:', type: :feature do
  before(:each) do
    @user1 = User.new(name: 'Marko', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                      posts_counter: 0)
    @user1.save
    @post = Post.new(title: 'Anything', text: 'Anything test', author: @user1)
    @post.save
  end

  scenario 'I can see the username of all other users' do
    visit users_path
    expect(page).to have_content(@user1.name)
  end
  scenario 'I can see the profile picture for each user.s' do
    visit users_path
    expect(@user1.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  scenario 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content(@user1.posts_counter)
  end
  scenario 'When I click on a user, I am redirected to that user show page' do
    visit users_path
    click_link(@user1.name)
    expect(page).to have_current_path(user_path(@user1.id))
  end
end
