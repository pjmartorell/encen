class Album < ActiveRecord::Base
  
  has_many :tracks, :dependent => :destroy
  has_many :images, :as => :owner, :dependent => :destroy
  mount_uploader :image, ImageUploader
  
  validates_presence_of :title
  validates_presence_of :image
  
  default_scope order('created_at asc')
  
  
end
