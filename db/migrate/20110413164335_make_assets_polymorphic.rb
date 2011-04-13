class MakeAssetsPolymorphic < ActiveRecord::Migration
  def self.up
    rename_column :assets, :post_id, :owner_id
    add_column :assets, :owner_type, :string

    Asset.all.each do |x|
      x.owner_type = "Post"
      x.save!
    end
  end

  def self.down
    remove_column :assets, :owner_type
    rename_column :assets, :owner_id, :post_id
  end
end
