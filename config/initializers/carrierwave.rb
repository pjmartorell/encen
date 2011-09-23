CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS', 
      :aws_access_key_id      => APP_CONFIG['storage']['s3_access'],
      :aws_secret_access_key  => APP_CONFIG['storage']['s3_secret'],
    }
    config.fog_directory  = 'romeu'
    config.fog_host       = 'http://romeu.s3.amazonaws.com'
    config.fog_public     = true
  end
end