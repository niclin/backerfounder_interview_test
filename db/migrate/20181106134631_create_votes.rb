class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.belongs_to :voteable, polymorphic: true
      t.integer :user_id
      t.boolean :upvote, default: false

      t.timestamps
    end
  end
end
