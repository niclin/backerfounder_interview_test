class ComputeScore
  include Sidekiq::Worker
  sidekiq_options unique: :until_executed
  sidekiq_options retry: false

  def perform
    Post.find_each(&:compute_score!)
  end
end
