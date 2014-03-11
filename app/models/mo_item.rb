class MoItem < ActiveRecord::Base
  acts_as_taggable
  validates_presence_of :title, :subtitle, :price, :author_id, :description, :item_type
  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader

  def file_url
    token = Qiniu::RS.generate_download_token :expires_in => 1800, :pattern => "cmw-rails.qiniudn.com#{file}"
    'http://cmw-rails.qiniudn.com/uploads/' + file + '?token=' + token
  end

  def isImage?
    if type == 'image'
      true
    end
    false
  end

end