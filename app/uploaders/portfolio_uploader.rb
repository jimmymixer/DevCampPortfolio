class PortfolioUploader < CarrierWave::Uploader::Base

  # storage :file
  # If conneted to AWS use..
  # stoage :aws
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # This was un-commented out # Provides a set of validation options
  def extension_whitelist
    %w(jpg jpeg gif png)
  end


end
