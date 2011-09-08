class RemoveDateFromAlbums < ActiveRecord::Migration
  def self.up
    remove_column :albums, :date
  end

  def self.down
    add_column :albums, :date, :date
  end
end
