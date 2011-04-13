class AddBodyToPageContents < ActiveRecord::Migration
  def self.up
    add_column :page_contents, :body, :text
  end

  def self.down
    remove_column :page_contents, :body
  end
end
