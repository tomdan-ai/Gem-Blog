require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland') }

  context 'Testing with no inputs' do
    it 'should not be valid' do
      post = Post.new # Create a new post instance for each test case
      expect(post).to_not be_valid
    end

    it 'likes counter must be 0 or greater' do
      post = Post.new # Create a new post instance for each test case
      expect(post.likes_counter).to be >= 0
      expect(post.likes_counter).to be_a(Integer)
    end

    it 'comments counter must be 0 or greater' do
      post = Post.new # Create a new post instance for each test case
      expect(post.comments_counter).to be >= 0
      expect(post.comments_counter).to be_a(Integer)
    end
    it 'return return_five_most_recent_comments' do
      expect(subject.return_five_most_recent_comments).to eq(subject.comments.order(updated_at: :desc).limit(5))
    end
  end

  context 'Validation Of Inputs' do
    it 'should be valid' do
      post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
      expect(post).to be_valid
    end

    it 'should have comments_counter equal to 0' do
      post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
      expect(post.comments_counter).to eq(0)
    end

    it 'should have likes_counter equal to 0' do
      post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
      expect(post.likes_counter).to eq(0)
    end

    it 'title should not be greater than 250 characters' do
      post = Post.new(author: user, title: 'a' * 251, text: 'My First Post')
      expect(post).not_to be_valid
    end
  end

  context 'Methods' do
    describe '#set_defaults' do
      it 'sets likes_counter to 0 if not already set' do
        post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
        post.save
        expect(post.likes_counter).to eq(0)
      end

      it 'sets comments_counter to 0 if not already set' do
        post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
        post.save
        expect(post.comments_counter).to eq(0)
      end
    end

    describe '#increment_counter' do
      it 'increments the postsCounter attribute on the associated author' do
        post = Post.new(author: user, title: 'Colors', text: 'They Make me happy!')
        expect { post.save }.to change { user.reload.postsCounter }.by(1)
      end
    end
  end
end
