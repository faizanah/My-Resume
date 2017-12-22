class DocumentUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  def extension_white_list
    %w(pdf doc htm html docx text txt)
  end

end
