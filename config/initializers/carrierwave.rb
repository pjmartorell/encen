CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.fog_credentials = {
    :provider               => 'AWS', 
    :aws_access_key_id      => APP_CONFIG['storage']['s3_access'],
    :aws_secret_access_key  => APP_CONFIG['storage']['s3_secret'],
  }
  config.fog_directory  = 'romeu'
  config.fog_host       = 'http://romeu.s3.amazonaws.com'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end