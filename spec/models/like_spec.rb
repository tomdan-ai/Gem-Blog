require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland') }
  let(:post) { Post.new(author: user, title: 'Hi Lilly', text: 'Your the gratest Teacher') }
  subject { Like.new(post:, author: user) }
  before { subject.save }

  it 'Increments Likes when Triggered' do
    expect { subject.send(:update_likes_counter) }.to change { post.reload.likes_counter }.by(1)
  end
end
