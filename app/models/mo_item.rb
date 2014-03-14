class MoItem < ActiveRecord::Base
  
  validates_presence_of :title, :subtitle, :price, :author_id, :description, :item_type

  acts_as_taggable

  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader

  include Redis::Objects
  counter :click_times
  counter :click_times_week

  def file_url(time, size)
    # New method accoding to API doc
    # @access_key = Qiniu::Conf.settings[:access_key]
    # @secret_key = Qiniu::Conf.settings[:secret_key]

    # @mac = Qiniu::Auth::Digest::Mac.new(@access_key, @secret_key)
    # base_url = Qiniu::Rs.make_base_url("a.qiniudn.com", "down.jpg")
    # get_policy = Qiniu::Rs::GetPolicy.new
    # get_policy.Expires = time
    # url = get_policy.make_request(base_url, @mac)

    token = Qiniu::RS.generate_download_token :expires_in => time, :pattern => "cmw-rails.qiniudn.com/uploads/#{File.basename(file.path)}-#{size}"
    file.to_s + '-' + size + '?token=' + token
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