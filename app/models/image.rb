class Image < Asset
  mount_uploader :file, ImageUploader
  validates_presence_of :file
end
