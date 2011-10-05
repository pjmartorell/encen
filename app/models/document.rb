class Document < Asset
  mount_uploader :file, DocumentUploader
  validates_presence_of :file
end
