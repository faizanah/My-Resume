class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [170, 170, :north]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
