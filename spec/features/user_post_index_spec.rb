RSpec.describe 'User post index page', type: :feature do
    let!(:user) { create(:user) }
    let!(:post1) { create(:post, user: user) }
    let!(:post2) { create(:post, user: user) }
    let!(:post3) { create(:post, user: user) }
  
    scenario 'I can see a post\'s title' do
      visit user_posts_path(user)
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post3.title)
    end
  
    # Other scenarios for user post index page
  end