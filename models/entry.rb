require 'carrierwave'
require 'carrierwave/orm/activerecord'

class ImageUploader < CarrierWave::Uploader::Base
	def default_url(*args)
    "/images/" + [version_name, "default.jpg"].compact.join('_')
  end
  storage :file
end

class Entry < ActiveRecord::Base
	belongs_to :user
	mount_uploader :entry_img, ImageUploader
end