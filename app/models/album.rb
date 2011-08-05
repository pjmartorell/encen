class Album < ActiveRecord::Base
  
  has_many :images, :as => :owner, :dependent => :destroy
  mount_uploader :image, ImageUploader
  
  validates_presence_of :title
  validates_presence_of :image
  
end
