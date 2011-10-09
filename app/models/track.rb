class Track < ActiveRecord::Base
  belongs_to :album
  has_one :document, :as => :owner, :dependent => :destroy
  mount_uploader :doc, DocumentUploader
  
  default_scope order('created_at asc')
  validates_presence_of :name  
end
