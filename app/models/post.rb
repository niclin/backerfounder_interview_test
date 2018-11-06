class Post < ApplicationRecord
  include Scoreable

  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
end
