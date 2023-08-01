require 'rails_helper'

RSpec.describe "Post Show Page", type: :feature do
  before do
    @user = User.create(name: "John Doe")
    @post = @user.posts.create(title: "First Post", text: "Text for First Post")
    visit user_post_path(@user, @post)
  end

  it "displays the post's title" do
    expect(page).to have_content("First Post")
  end

  it "displays the number of comments the post has" do
    expect(page).to have_content("Comments: 0")
  end

  it "displays the number of likes the post has" do
    expect(page).to have_content("Likes: 0")
  end

  it "displays the post body" do
    expect(page).to have_content("Text for First Post")
  end

  it "displays a link to add a new comment" do
    expect(page).to have_link("Add Comment", href: new_post_comment_path(@post))
  end
end
