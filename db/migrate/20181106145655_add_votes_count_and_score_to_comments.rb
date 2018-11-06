class AddVotesCountAndScoreToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :votes_count, :integer, default: 0
    add_column :comments, :score, :integer, default: 0
  end
end
