class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  acts_as_tree order: 'created_at DESC'
end
