class AddScoreToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :score, :integer, default: 0
    rename_column :posts, :point, :votes_count
  end
end
