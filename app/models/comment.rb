# rubocop:disable all

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
