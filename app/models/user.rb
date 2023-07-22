class User < ApplicationRecord
  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  after_initialize :set_defaults

  def set_defaults
    self.postsCounter ||= 0
  end

  def return_three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
