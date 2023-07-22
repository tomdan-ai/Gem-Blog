require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Liliy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland') }
  let(:post) { Post.new(author:, title: 'Nature', text: 'I love this!') }
  subject { Comment.new(post:, author:, text: 'It is nice') }
  before { subject.save }

  context 'Update Comment Counter' do
    it 'increments the post\'s comments_counter on save' do
      expect { subject.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
