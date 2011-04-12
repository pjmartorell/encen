class AddMoreStuffToSubscriptors < ActiveRecord::Migration
  def self.up
    add_column :subscriptors, :company, :string
    add_column :subscriptors, :charge, :string
  end

  def self.down
  end
end
