class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  acts_as_tree order: 'created_at DESC'
end
