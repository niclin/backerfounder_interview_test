class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes

  def compute_score!
    time = (Time.now - self.created_at) / 3600.0
    gravity = 1.5
    points = self.votes_count.to_i

    score = (points - 1)/(time + 2) ** gravity
    self.update_attributes(score: score * 1000)
  end
end
