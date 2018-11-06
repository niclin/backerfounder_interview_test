class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post
  counter_culture :post, column_name: proc { |model| model.upvote? ? "votes_count" : nil },
                          column_names: { ["votes.upvote = ?", true] => "votes_count" }
end
