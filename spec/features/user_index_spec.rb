RSpec.describe 'User index page', type: :feature do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user3) { create(:user) }
  
    scenario 'I can see the username of all other users' do
      visit users_path
      expect(page).to have_content(user1.username)
      expect(page).to have_content(user2.username)
      expect(page).to have_content(user3.username)
    end
  
    # Other scenarios for user index page
  end