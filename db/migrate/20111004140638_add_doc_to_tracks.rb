class AddDocToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :doc, :string
  end

  def self.down
    remove_column :tracks, :doc
  end
end
