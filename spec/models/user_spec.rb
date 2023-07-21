require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validating Users Input' do
    subject { User.new }
    before { subject.save }

    it 'required:User should have name' do
      expect(subject).to_not be_valid
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
