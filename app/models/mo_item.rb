class MoItem < ActiveRecord::Base
  validates_presence_of :title, :subtitle, :price, :author_id, :description, :type
  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader
end