require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  it 'displays the username of all other users' do
    user1 = User.create(name: 'User 1')
    user2 = User.create(name: 'User 2')

    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'displays the profile picture for each user' do
    user1 = User.create(name: 'User 1', photo: 'user1.jpg')
    user2 = User.create(name: 'User 2', photo: 'user2.jpg')

    visit users_path

    expect(page).to have_selector("img[src='#{user1.photo}']")
    expect(page).to have_selector("img[src='#{user2.photo}']")
  end

  it 'displays the number of posts each user has written' do
    user1 = User.create(name: 'User 1')
    user1.posts.create(title: 'Post 1', text: 'Text for Post 1')
    user1.posts.create(title: 'Post 2', text: 'Text for Post 2')

    user2 = User.create(name: 'User 2')
    user2.posts.create(title: 'Post 3', text: 'Text for Post 3')

    visit users_path
    expect(page).to have_content("Number Of Posts: 2", count: 1)
    expect(page).to have_content("Number Of Posts: 1", count: 1)
  end

  it 'redirects to user show page when clicking on a user' do
    user = User.create(name: 'User 1')
    visit users_path
    click_link 'View Profile'
    expect(current_path).to eq(user_path(user))
  end
end
