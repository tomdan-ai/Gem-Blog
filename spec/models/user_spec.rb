require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validating Users Input' do
    subject { User.new }
    before { subject.save }

    it 'required:User should have name' do
      expect(subject).to_not be_valid
    end
    it 'return return_three_most_recent_posts' do
      expect(subject.return_three_most_recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
    end
  end
  context 'Validating Users Data' do
    subject(:user) { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland') }
    before { user.save }

    it 'Name of user ahould be valid' do
      expect(user).to be_valid
    end
  end
end
