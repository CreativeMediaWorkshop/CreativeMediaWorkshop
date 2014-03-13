class MoItem < ActiveRecord::Base
  
  validates_presence_of :title, :subtitle, :price, :author_id, :description, :item_type

  acts_as_taggable

  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader

  include Redis::Objects
  counter :click_times
  counter :click_times_week

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

  def hit
    click_times.increment;
    click_times_week.increment;
  end

  def daily_refresh
    temp = Random.rand(1...MoItem.count)
    $redis.set('daily_item', temp)
  end

  def weekly_refresh
    MoItem.All.each {|i| i.click_times_week.reset }
  end

  def top_ten
    MoItem.find(:all, :order => "click_times desc", :limit => 10).reverse
  end

  def top_ten_week
    MoItem.find(:all, :order => "click_times_week desc", :limit => 10).reverse
  end
end