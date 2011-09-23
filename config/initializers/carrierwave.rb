CarrierWave.configure do |config|

    config.s3_access_key_id = APP_CONFIG['storage']['s3_access']
    config.s3_secret_access_key = APP_CONFIG['storage']['s3_secret']
    config.s3_bucket = 'romeu'
    
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
end