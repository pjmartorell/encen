class CreateConcerts < ActiveRecord::Migration
  def self.up
    create_table :concerts do |t|
      t.datetime :date
      t.text :event
      t.string :city
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :concerts
  end
end
