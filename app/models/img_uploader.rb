class ImgUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{Rails.root}/public/postings"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end