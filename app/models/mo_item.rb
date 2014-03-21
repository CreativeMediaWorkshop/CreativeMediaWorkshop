class MoItem < ActiveRecord::Base
  
  validates_presence_of :author_id, :item_type

  acts_as_taggable

  paginates_per 24

  # Support for other file types is not implemented
  mount_uploader :file, ImageUploader

  include Redis::Objects
  counter :click_times
  counter :click_times_week

  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  after_create :additional_configuration
  def additional_configuration
    $PIOclient.create_item(id, item_type)
  end

  #Useful methods
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

  def image?
    if type == 'image'
      true
    else
      false
    end
  end

  def daily?
    if $redis.get('daily_item_id').to_i == id
      true
    else
      false
    end
  end

  def hit
    click_times.increment
    click_times_week.increment
    if current_cmw_account
      $PIOclient.identify(current_cmw_account.id)
      $PIOclient.record_action_on_item('view', id)
    end
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