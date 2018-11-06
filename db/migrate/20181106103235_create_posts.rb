class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :point
      t.integer :user_id
      t.string :link_url

      t.timestamps
    end
  end
end
