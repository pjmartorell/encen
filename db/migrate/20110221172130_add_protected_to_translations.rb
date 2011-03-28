class AddProtectedToTranslations < ActiveRecord::Migration
  def self.up
    add_column :translations, :protected, :boolean, :default => false
  end

  def self.down
    remove_column :translations, :protected
  end
end
