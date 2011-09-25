CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS', 
      :aws_access_key_id      => ENV['s3_access_key_id'],
      :aws_secret_access_key  => ENV['s3_secret_access_key']
    }
    config.fog_directory  = 'romeu'
    config.fog_host       = 'http://romeu.s3.amazonaws.com'
    config.fog_public     = true
    
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
end