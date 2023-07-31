RSpec.describe 'Post show page', type: :feature do
    let!(:post) { create(:post) }
  
    scenario 'I can see the post\'s title' do
      visit post_path(post)
      expect(page).to have_content(post.title)
    end
  
    # Other scenarios for post show page
  end