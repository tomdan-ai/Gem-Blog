require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  let!(:user) { User.create(name: 'John Doe') }
  let!(:post1) { user.posts.create(title: 'First Post', text: 'Text for First Post') }
  let!(:post2) { user.posts.create(title: 'Second Post', text: 'Text for Second Post') }

  before do
    visit user_posts_path(user)
  end

  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end

  it "displays a post's title and some of the post's body" do
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text.truncate(100))
  end

  it 'displays the first comments on a post' do
    comment1 = post1.comments.create(author: user, text: 'First comment')
    comment2 = post1.comments.create(author: user, text: 'Second comment')

    visit user_posts_path(user)

    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
  end
end
