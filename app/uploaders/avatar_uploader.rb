class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
    # Public ID on Cloudinary
    "default_avatar"
  end
end
