class Comment < ApplicationRecord
  include Scoreable
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  acts_as_tree order: 'score DESC'
end
