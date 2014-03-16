class MoItem < ActiveRecord::Base
  
  validates_presence_of :author_id, :item_type

  acts_as_taggable

  paginates_per 24

  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader

  include Redis::Objects
  counter :click_times
  counter :click_times_week

  def file_url(time, size)
    if via_uploader
      name = File.basename(file.path)
    else
      name = file_url_manual
    end
    if size == '-'
      suffix = ''
    else
      suffix = '-' + size
    end
    token = Qiniu::RS.generate_download_token :expires_in => time, :pattern => "cmw-rails.qiniudn.com/mo_image/#{name}#{suffix}"
    "http://cmw-rails.qiniudn.com/mo_image/#{name}#{suffix}?token=#{token}"
  end

  def isImage?
    if type == 'image'
      true
    end
    false
  end

  def hit
    click_times.increment
    click_times_week.increment
  end

  def MoItem.daily_refresh
    $redis.set('daily_item_id', MoItem.all.sample.id)
  end

  def MoItem.weekly_refresh
    MoItem.All.each {|i| i.click_times_week.reset }
  end

  def MoItem.top_ten
    MoItem.find(:all, :order => "click_times desc", :limit => 10).reverse
  end

  def MoItem.top_ten_week
    MoItem.find(:all, :order => "click_times_week desc", :limit => 10).reverse
  end
end