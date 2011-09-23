# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Storing and URL config
  storage :fog

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end
  
  # Album Cover version
  version :cover do
    process :square_resize => [150,150]
  end

  # Thumb version
  version :thumb do
    process :square_crop => [80,80]
  end

  def square_crop(width, height)
    manipulate! do |img|
      side = [img['width'], img['height']].min
      x = (img['width'] - side) / 2
      y = (img['height'] - side) / 2
      img.crop("#{side}x#{side}+#{x}+#{y}")
      img.resize("#{width}x#{height}")
      img
    end
  end
  
  def square_resize(width, height)
    manipulate! do |img|
      img.resize("#{width}x#{height}")
      img
    end
  end

  # Valid list
  def extension_white_list
        %w(jpg jpeg gif png)
  end
end
