CarrierWave.configure do |config|
  config.permissions = 0777      
  config.s3_access_key_id = APP_CONFIG['storage']['s3_access']
  config.s3_secret_access_key = APP_CONFIG['storage']['s3_secret']
  config.s3_bucket = 'romeu'
end