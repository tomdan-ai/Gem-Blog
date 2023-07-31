RSpec.describe 'User show page', type: :feature do
    let!(:user) { create(:user) }
  
    scenario 'I can see the user\'s profile picture' do
      visit user_path(user)
      expect(page).to have_css('img.user-img')
    end
  
    # Other scenarios for user show page
  end
  