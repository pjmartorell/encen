class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.date :date
      t.text :body
      t.integer :user_id
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
