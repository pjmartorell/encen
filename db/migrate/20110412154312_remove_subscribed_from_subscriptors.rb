class RemoveSubscribedFromSubscriptors < ActiveRecord::Migration
  def self.up
    remove_column :subscriptors, :subscribed
  end

  def self.down
  end
end
