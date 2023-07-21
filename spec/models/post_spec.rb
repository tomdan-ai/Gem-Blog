require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create }

  context 'Testing with no inputs' do
    it 'should not be valid' do
      expect(post).to_not be_valid
    end

    it 'likes counter must be 0 or greater' do
      expect(subject.likes_counter).to be >= 0
      expect(subject.likes_counter).to be_a(Integer)
    end

    it 'comments counter must be 0 or greater' do
      expect(subject.comments_counter).to be >= 0
      expect(subject.comments_counter).to be_a(Integer)
    end
  end

  context 'Validation Of Inputs' do
    let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland') }
    subject { Post.new(author: user, title: 'Colors', text: 'They Make me happy!') }
    before { subject.save }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have comments_counter equal to 0' do
      expect(subject.comments_counter).to eq(0)
    end

    it 'should have likes_counter equal to 0' do
      expect(subject.likes_counter).to eq(0)
    end

    it 'title should not be greater than 250 characters' do
      post = Post.create(author: user, title: 'a' * 251, text: 'My First Post')
      expect(post).not_to be_valid
    end
  end
end
