
#/uploader/uploader.rb
class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file


  process :resize_to_fill => [200, 200]

  def store_dir
    'images'
  end
end