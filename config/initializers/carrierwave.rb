::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "fSb2jPKk_v_T7f6bu4kFFeyfxIgv9IpY_Av9qmp7"
  config.qiniu_secret_key    = "tuX5EUZShy7bNFKod3sA0DPUhJ6724v50kXKTF2t"
  config.qiniu_bucket        = "cmw-rails"
  config.qiniu_bucket_domain = "cmw-rails.qiniudn.com"
  config.qiniu_block_size    = 4*1024*1024
end