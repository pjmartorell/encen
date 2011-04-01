class AddImageToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :file, :string
  end

  def self.down
    remove_column :assets, :file
  end
end
