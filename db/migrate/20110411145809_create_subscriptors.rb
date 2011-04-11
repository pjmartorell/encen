class CreateSubscriptors < ActiveRecord::Migration
  def self.up
    create_table :subscriptors do |t|
      t.string :name
      t.string :last_name
      t.string :token
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptors
  end
end
