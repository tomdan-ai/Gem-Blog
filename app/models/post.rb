class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_initialize :set_defaults

  private

  def update_posts_counter
    author.increment!(:postsCounter)
  end

  def set_defaults
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
