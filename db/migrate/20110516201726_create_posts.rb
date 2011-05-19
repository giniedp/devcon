class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.string :description
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
