class ComputeScore
  include Sidekiq::Worker
  sidekiq_options unique: :until_executed
  sidekiq_options retry: false

  def perform
    [Post, Comment].each do |model|
      model.find_each(&:compute_score!)
    end
  end
end
