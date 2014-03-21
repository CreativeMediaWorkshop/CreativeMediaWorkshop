::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = Rails.application.secrets.qiniu_access_key
  config.qiniu_secret_key    = Rails.application.secrets.qiniu_secret_key
  config.qiniu_bucket        = "cmw-rails"
  config.qiniu_bucket_domain = "cmw-rails.qiniudn.com"
  config.qiniu_block_size    = 4*1024*1024
end