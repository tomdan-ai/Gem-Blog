class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  after_initialize :set_defaults

  private


  def set_defaults
    self.postsCounter ||= 0
  end
end
