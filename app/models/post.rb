class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
  after_destroy :reduce_posts_counter
  after_initialize :set_defaults

  def update_posts_counter
    author.increment!(:postsCounter)
  end

  def reduce_posts_counter
    author.decrement!(:postsCounter)
  end

  def set_defaults
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  def return_five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
