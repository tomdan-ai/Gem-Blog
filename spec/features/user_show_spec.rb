require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let!(:user) do
    User.create!(
      name: 'John Doe',
      photo: 'user.jpg',
      bio: 'This is John Doe.'
    )
  end

  let!(:post1) do
    user.posts.create!(
      title: 'First Post',
      text: 'Text for First Post'
    )
  end

  let!(:post2) do
    user.posts.create!(
      title: 'Second Post',
      text: 'Text for Second Post'
    )
  end

  let!(:post3) do
    user.posts.create!(
      title: 'Third Post',
      text: 'Text for Third Post'
    )
  end

  it 'displays the user profile picture, username, number of posts, and bio' do
    visit user_path(user)

    expect(page).to have_selector("img[src='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number Of Posts: #{user.posts.count}")
    expect(page).to have_content(user.bio)
  end

  it 'displays the first 3 posts of the user' do
    visit user_path(user)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
  end

  it 'displays a button to view all of a user\'s posts' do
    visit user_path(user)

    expect(page).to have_link('See All Posts', href: user_posts_path(user))
  end

  it 'redirects to the post show page when clicking a user\'s post' do
    visit user_path(user)

    click_link 'View Comments', match: :first
  end

  it 'redirects to the user\'s posts index page when clicking to view all posts' do
    visit user_path(user)

    click_link 'See All Posts'

    expect(current_path).to eq(user_posts_path(user))
  end
end
